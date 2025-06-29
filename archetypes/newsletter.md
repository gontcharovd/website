---
title: "Title"
date: '{{ time.Now.Format "2006-01-02" }}'
issueno: "{{ printf "%03d" (add (len (readDir "content/newsletter")) -2) }}"
draft: false
---
