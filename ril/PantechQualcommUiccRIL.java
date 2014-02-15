/*
* Copyright (C) 2012 The CyanogenMod Project
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

package com.android.internal.telephony;

import static com.android.internal.telephony.RILConstants.*;

import android.content.Context;
import android.os.Message;
import android.os.Parcel;
import android.os.SystemProperties;
import android.telephony.SignalStrength;
import android.text.TextUtils;
import android.util.Log;

import java.util.ArrayList;

/**
 * Custom Qualcomm No SimReady RIL for LGE using the latest Uicc stack
 *
 * {@hide}
 */
public class PantechQualcommUiccRIL extends QualcommSharedRIL implements CommandsInterface {
    boolean RILJ_LOGV = true;
    boolean RILJ_LOGD = true;

    public PantechQualcommUiccRIL(Context context, int networkMode, int cdmaSubscription) {
        super(context, networkMode, cdmaSubscription);
    }

    /*
    @Override
    public void
    setupDataCall(String radioTechnology, String profile, String apn,
            String user, String password, String authType, String protocol,
            Message result) {

        RILRequest rrSPT = RILRequest.obtain(
                121, null); //121 - RIL_REQUEST_VSS_SET_PDN_TABLE
        rrSPT.mp.writeInt(1); // pdnId
        rrSPT.mp.writeInt(apn.length()); // apnLength
        rrSPT.mp.writeString(apn); // apn
        rrSPT.mp.writeInt(0); // ipType
        rrSPT.mp.writeInt(0); // inactivityTime
        rrSPT.mp.writeInt(1); // enable
        send(rrSPT);



        RILRequest rr
                = RILRequest.obtain(RIL_REQUEST_SETUP_DATA_CALL, result);

        rr.mp.writeInt(7);

        rr.mp.writeString(radioTechnology);
        rr.mp.writeString(profile);
        rr.mp.writeString(apn);
        rr.mp.writeString(user);
        rr.mp.writeString(password);
        rr.mp.writeString(authType);
        rr.mp.writeString(protocol);

        if (RILJ_LOGD) riljLog(rr.serialString() + "> "
                + requestToString(rr.mRequest) + " " + radioTechnology + " "
                + profile + " " + apn + " " + user + " "
                + password + " " + authType + " " + protocol);

        send(rr);
    }
    */

    @Override
    protected Object
    responseSetupDataCall(Parcel p) {
        DataCallState dataCall;

        boolean oldRil = needsOldRilFeature("datacall");

        if (!oldRil)
           return super.responseSetupDataCall(p);

        p.readString();
        return super.responseSetupDataCall(p);

    }
    @Override
    protected Object
    responseIccCardStatus(Parcel p) {
        IccCardApplicationStatus appStatus;

        IccCardStatus cardStatus = new IccCardStatus();
        cardStatus.setCardState(p.readInt());
        cardStatus.setUniversalPinState(p.readInt());
        cardStatus.mGsmUmtsSubscriptionAppIndex = p.readInt();
        cardStatus.mCdmaSubscriptionAppIndex = p.readInt();
        cardStatus.mImsSubscriptionAppIndex = p.readInt();

        int numApplications = p.readInt();

        // limit to maximum allowed applications
        if (numApplications > IccCardStatus.CARD_MAX_APPS) {
            numApplications = IccCardStatus.CARD_MAX_APPS;
        }
        cardStatus.mApplications = new IccCardApplicationStatus[numApplications];

        for (int i = 0 ; i < numApplications ; i++) {
            appStatus = new IccCardApplicationStatus();
            appStatus.app_type       = appStatus.AppTypeFromRILInt(p.readInt());
            appStatus.app_state      = appStatus.AppStateFromRILInt(p.readInt());
            appStatus.perso_substate = appStatus.PersoSubstateFromRILInt(p.readInt());
            if ((appStatus.app_state == IccCardApplicationStatus.AppState.APPSTATE_SUBSCRIPTION_PERSO) &&
                ((appStatus.perso_substate == IccCardApplicationStatus.PersoSubState.PERSOSUBSTATE_READY) ||
                 (appStatus.perso_substate == IccCardApplicationStatus.PersoSubState.PERSOSUBSTATE_UNKNOWN))) {
                    // ridiculous hack for network SIM unlock pin
                    appStatus.app_state = IccCardApplicationStatus.AppState.APPSTATE_UNKNOWN;
                    Log.d(LOG_TAG, "ca.app_state == AppState.APPSTATE_SUBSCRIPTION_PERSO");
                    Log.d(LOG_TAG, "ca.perso_substate == PersoSubState.PERSOSUBSTATE_READY");
            }
            appStatus.aid            = p.readString();
            appStatus.app_label      = p.readString();
            appStatus.pin1_replaced  = p.readInt();
            appStatus.pin1           = appStatus.PinStateFromRILInt(p.readInt());
            appStatus.pin2           = appStatus.PinStateFromRILInt(p.readInt());
            p.readInt(); // remaining_count_pin1 - pin1_num_retries
            p.readInt(); // remaining_count_puk1 - puk1_num_retries
            p.readInt(); // remaining_count_pin2 - pin2_num_retries
            p.readInt(); // remaining_count_puk2 - puk2_num_retries
            p.readInt(); // - perso_unblock_retries
            cardStatus.mApplications[i] = appStatus;
        }
        return cardStatus;
    }
    @Override
    protected Object
    responseSignalStrength(Parcel p) {
        int numInts = 12;
        int response[];

        boolean oldRil = needsOldRilFeature("signalstrength");
        boolean noLte = false;

        /* TODO: Add SignalStrength class to match RIL_SignalStrength */
        response = new int[numInts];
        for (int i = 0 ; i < numInts ; i++) {
            if ((oldRil || noLte) && i > 6 && i < 12) {
                response[i] = -1;
            } else {
                response[i] = p.readInt();
            }
            if (i == 8 && response[i] == 99) {
                response[i] = -1;
                noLte = true;
            }
        }
        return new SignalStrength(response[0], response[1], response[2], response[3], response[4], response[5], response[6], response[7],response[8], response[9], response[10], response[11], true);
    }

}