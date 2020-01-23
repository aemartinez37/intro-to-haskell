---
layout: default
---

<h1>Introduction to Haskell</h1>

- <cite>Programming in Haskell</cite> by Graham Hutton
- <cite>Learn you a Haskell for great good!</cite> by Miran Lipovača

{% for module in site.modules %}
{% include module.html module=module %}
{% endfor %}
