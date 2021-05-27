---
layout: default
title: Newsletter
permalink: /newsletter
---

# ✉️ Tiny Letters

[Subscribe to my newsletter](https://tinyletter.com/connorjrobbins) for twice monthly musings and updates.

## 📪 Previous editions

{% for newsletter in site.newsletters reversed %}
<div class="list-entry">
	<div><a class="internal-link" href="{{ newsletter.url }}">{{ newsletter.subject }}</a> <span class="faded">({{ newsletter.date | date: "%Y-%m-%d" }})</span></div>
	<div>{{ newsletter.excerpt }}</div>
</div>
{% endfor %}
