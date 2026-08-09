---
title: "Rebuilding SaaS Solutions in Databricks"
date: 2026-08-09T19:36:34+02:00
draft: false
---

I had an epiphany today: Databricks can help Sales Managers cut SaaS spend by rebuilding third party solutions on our platform.

# The Problem

Many enterprises (including us at Databricks!) spend lots of money on third-party SaaS tools. These solutions are lacking because they don't take into account the company's own data (from their CRM), so the recommendations are not so relevant. Hence me and my colleagues are not really using them (but the company still pays for our seats).

In general, companies are tired of their SaaS sprawl: The average company now runs roughly 300 SaaS apps, wastes $21M a year on licenses it doesn't use, and lets lines of business control 70% of software spend[^1].

# The solution

Help our clients rebuild the functionalities of sales SaaS tools on their Databricks platform. Not only will the results be better because they're combining external data with their own data, but it will also be significantly cheaper as they will only pay for their Databricks compute resources instead of expensive subscriptions.

## Examples

My company, Databricks, already ingests all its data from our CRM into our Databricks platform. I'm currently building these solutions for myself because I find them useful:

* Visualization of my sales performance (activity calls/emails, meetings booked, conversion rates, pipeline generated).

* A recommendation engine that suggest which leads to follow up with which messaging based on a prospect's past activity combined external signals (promotions, news, industry trends, etc.). In addition, the engine generates insights about what's happening in my accounts based on actual conversations my sales team is having with our clients.

My list of ideas is endless and I can directly implement them in my job and test their effectiveness before pitching them to our clients.

# Target Persona

This Databricks use case is targeted at sales departments because A) that's where I have experience as a BDR and B) they are key revenue-generating business units instead of cost centers at our clients. There's direct bottom line impact. Concretely, this means any sales leader (BDR Manager or AE Manager) that wants to improve the performance of their sales team and reduce SaaS spend and whose organization owns a Databricks platform.

# Business Case

Why should our clients pay for an expensive external solution, if they can now build an equal or better tool themselves quickly[^2] that is fully integrated into your enterprise? Not to mention getting rid of vendor lock-in and improving your information security.

# Why I'm Betting on Sales Use Cases

From my former life as a data engineer, I have deep expertise in building data solutions. With my current experience as a Business Development Representative (BDR) in sales, I interact daily with sales leaders and colleagues, and am painfully aware of the needs and challenges of this role. I'm still toying with this idea, but I already believe I'll be able to unlock a ton of value for my clients in the Healthcare & Life Sciences spaces. After all, every company needs to sell.

# Validation

I'm currently developing solutions for myself, to improve my performance as a Business Development Representative (BDR). When I have something working, I can share it with my team to see if they adopt it as well. Once I have something good, I can pitch the idea to the clients in our patch to see if they're interested. Hopefully this will lead to many new use cases for Databricks!

[^1]: [The Real Cost of SaaS Sprawl in 2026](https://tools8020.com/blog/saas-sprawl-2026/)
[^2]: Using our AI vibe-coding solution [Genie Code](https://www.databricks.com/product/genie/code).
[^3]: Roughly 70% of Fortune 500 companies.
