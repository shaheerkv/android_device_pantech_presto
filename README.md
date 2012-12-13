android_device_pantech_presto
===================================
Android device tree for Pantech Burst P9070 (presto) - Jellybean branch.
<h3>Initial source:</h3>
Common configurations for Qualcomm chipsets, based on source from Code Aurora Forum - Gitweb.
<ul>
<li>https://www.codeaurora.org/gitweb/quic/la/?p=device/qcom/common.git</li>
<li>https://www.codeaurora.org/gitweb/quic/la/?p=platform/vendor/qcom/msm8660_surf.git</li>
</ul>
<h3>Dependencies</h3>
To compile the rom correctly you should add to your "local_manifest.xml" the kernel repository:
<pre>
&lt;project name="mifl/android_device_pantech_presto" path="device/pantech/presto" remote="github" revision="jellybean" /&gt;
&lt;project name="mifl/android_kernel_pantech_p9070" path="kernel/pantech/p9070" remote="github" revision="jellybean" /&gt;
</pre>
You can also include the repository with the necessary files for complilación:
<pre>
&lt;project name="mifl/android_vendor_pantech_presto" path="vendor/pantech/presto" remote="github" revision="jellybean" /&gt;
</pre>
<h3>Information and links</h3>
Device tree works in progress.
You can find more information at the following links:
<ul>
<li>DevsNest website Subforum dedicated to the Pantech Burst: http://www.devsnest.com/viewforum.php?f=2</li>
</ul>
