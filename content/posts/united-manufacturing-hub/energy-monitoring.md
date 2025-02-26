---
title: "Energy Monitoring to comply with the German Energy Efficiency Act (EnEfG)"
date: 2024-07-02T14:30:05+02:00
categories:
    - Blog
tags:
    - United Manufacturing Hub
    - Energy Monitoring
---

*This article was written for the [United Manufacturing Hub](https://learn.umh.app/blog/cloud-native-technologies-on-the-edge-in-manufacturing/)*

*Energy monitoring can help you comply with the Energy Efficiency Act (EnEfG), mandating energy-intensive companies, public institutions, and data centers to monitor and reduce their energy consumption. Read the article to learn more!*

On 21 September 2023, the German government passed the Energy Efficiency Act (EnEfG). Energy-intensive companies, public institutions, and data centers must monitor and, where possible, reduce their energy consumption. Complying with these new regulations requires installing additional systems and data processing capabilities. This article highlights how the United Manufacturing Hub (UMH) can help companies comply with these regulations effectively.

# New regulatory requirements

Concretely, companies with an annual energy consumption exceeding 7.5 GWh must implement an Energy Management System (ENMS), if they didn't already have one. This ENMS captures data on energy supply and discharge: temperatures, fluid flow rates and heat flows. The new law gives companies twenty months to comply.

In addition, all companies with a yearly energy consumption exceeding 2.5 GWh, are required to develop and publish concrete energy-saving measures. These measures should originate from either an internal energy audit or an ENMS, and be economically viable. Again, companies are given three years to comply.

It's important to note that both the ENMS and the energy-saving measures will potentially be subjected to a random audit that requires full transparency on the individual asset level. This means that the data must be stored in such a way, that it can be easily shared during an audit.

# Technology requirements

To meet these new stringent regulations, most companies will have to upgrade their energy monitoring and management systems. One key technology in that regard has been the Meter-Bus (MBUS) protocol. MBUS is an EU standard for transmitting data on heat, energy, water, and gas consumption, but it also partly adopted in the United States.

The hardware setup of energy systems typically consists of smart meters with centralized gateways and converters that collect the data points and communicate them over various network protocols like TCP or ModBus. Although rudimentary, this setup is stable and reliable for continuous data collection.

Unifying the energy data requires an centralized system that collects all energy data in one place: the historian. Once unified, the historical energy data can be used to identify energy-saving opportunities and evaluate viable business cases that pass government audits. Ingesting data into the historian can be done with modern open-source technologies like Benthos and Node-RED. Both offer specific converters that allow connecting to the MBUS source systems. However, as there is no universal standard for converters, compatibility will still depend on the present hardware. 

# How the United Manufacturing Hub can help your company

The UMH offers a robust end-to-end solution for ingesting and unifying all your energy data. With both Benthos and Node-RED provided and configured out-of-the-box, connecting to smart meters via MBUS becomes trivial. In practice, the Node-RED node for M-Bus protocol plugin can easily be used to connect to energy, water and gas meters like the Elvaco CMi1020 or WAGO 753-649 M-Bus Modules.

Once connected, the energy data flows into the Unified Namespace where it is transported to the Historian for long term storage. From there, all data can easily be visualized on a real-time dashboard using Grafana. This pre-configured solution allows companies to quickly set up the entire data pipeline on a single instance without needing any middleware, ensuring rapid time-to-value.

![](/images/united-manufacturing-hub/energym.png)
*Energy monitoring dashboard build with UMH. Source: United Manufacturing Hub*

# Conclusion

In summary, the UMH offers a fast end-to-end solution for implementing MBUS strategies. This ensures compliance with new energy efficiency laws by allowing valuable insights into the data to optimize your energy use.

Feel free to try out the UMH yourself, if you want to learn more!
