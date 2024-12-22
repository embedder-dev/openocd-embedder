---

title: The xPack OpenOCD releases
permalink: /dev-tools/openocd/releases/

search: exclude
github_editme: false

comments: false
toc: false

date: 2015-09-10 09:08:00 +0300

redirect_to: https://xpack-dev-tools.github.io/openocd-xpack/docs/releases/

---

___
{% for post in site.posts %}{% if post.categories contains "releases" %}{% if post.categories contains "openocd" %}
* [{{ post.title }}]({{ site.baseurl }}{{ post.url }}) [(download)]({{ post.download_url }}){% endif %}{% endif %}{% endfor %}
