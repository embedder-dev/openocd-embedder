---

title: The xPack OpenOCD Frequently Asked Questions
permalink: /dev-tools/openocd/faq/

comments: true
toc: false

date: 2019-06-24 14:08:00 +0300

redirect_to: https://xpack-dev-tools.github.io/openocd-xpack/docs/faq/

---

<br/>

{% capture question_1 %}
My JTAG probe XXX is not supported, can you add it?
{% endcapture %}

{% capture answer_1 %}
Unfortunately not. The xPack OpenOCD is only a binary distribution of the standard source code OpenOCD, and does not intend to add new functionality. Please use the official OpenOCD [support channels](https://openocd.org/pages/discussion.html) to ask for new features.
{% endcapture %}

{% capture question_2 %}
I cannot find a connection script for my board XXX, can you add it?
{% endcapture %}

{% capture answer_2 %}
Unfortunately not. The xPack OpenOCD is only a binary distribution of the standard source code OpenOCD, and does not intend to add new functionality. Please use the official OpenOCD [support channels](https://openocd.org/pages/discussion.html) to ask for new features.
{% endcapture %}

{% capture question_3 %}
`libusb_open failed: LIBUSB_ERROR_ACCESS`
{% endcapture %}

{% capture answer_3 %}
You are using GNU/Linux and your user has no permission to write to USB. Please review the [install](../install/) page.
{% endcapture %}

{% include div-panel-group.html %}
{% include faq-panel.html id="collapse-1" question=question_1 answer=answer_1 %}
{% include faq-panel.html id="collapse-2" question=question_2 answer=answer_2 %}
{% include faq-panel.html id="collapse-3" question=question_3 answer=answer_3 %}
{% include div-end.html %}
