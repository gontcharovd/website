---
title: "NAMUR Open Architecture versus Unified Namespace: Two sides of the same coin?"
date: 2024-06-05T09:51:13+02:00
categories:
    - Blog
tags:
    - United Manufacturing Hub
    - Unified Namespace
---

Article written for the [United Manufacturing Hub](https://learn.umh.app/blog/unified-namespace-versus-namur-differences-and-similarities/).

> Why do we need the Unified Namespace if we already have the NAMUR Open Architecture?

In this article, we compare the Unified Namespace (UNS) and NAMUR Open Architecture (NOA). First, we highlight that they both extend the traditional automation pyramid to enable industrial Internet of Things (IIoT). Second, both architectures outline a highly-reliable IT infrastructure. Third, both architectures are applicable to operate in manufacturing, chemical and pharma, all very conservative industry that are slow to adopt new technical innovations.

![](/images/united-manufacturing-hub/noa1_git1021.png)
*The NAMUR Open Architecture extends the Classical Automation Pyramid. Source: NAMUR Recommendation NE 175 specification.*

### What is NAMUR?

NAMUR was founded in 1949 in Germany as a cross-company industrial organization whose prominent members include large international companies like BASF and Bayer. The organization represents the interests of users of automation technology in the chemical and pharmaceutical process industry. To this aim, the NAMUR recommendation provides guidelines and standards to facilitate the adoption of Industry 4.0 technologies in both greenfield and brownfield environments. Despite being a German organization, NAMUR's influence impacts practices in process automation across the globe. The organization deliberately excludes technology vendors from their membership base to ensure its non-commercial goals.


### What is Unified Namespace (UNS)?

The UNS has exploded in popularity since 2020 as it was popularized by Walker Reynolds in the United States. Since then, the UNS found its way across the Atlantic to factories in Europe. The UNS regularly makes appearances at large international industrial conferences like the Hannover Messe in Germany. In addition, industrial software vendors like the United Manufacturing Hub explicitly incorporate the UNS in their product offerings.

# Monitoring and Optimization: NOA and UNS extend the Automation Pyramid

NOA is an IT architecture proposed by the NAMUR organization and documented in the NAMUR Recommendation NE 175 . The focus of NAMUR lies on a clear separation of process control, i.e. the automation pyramid, from monitoring and optimization. This separation ensures that the implementation of IIoT and advanced analytics has a minimal impact on the production process. 

![](/images/united-manufacturing-hub/1598447801344.png)
*Main NOA Building Blocks and their Interaction. Source: NAMUR Recommendation NE 175 specification.*

NOA divides the plant systems into two main domains: the Core Process Control (CPC) domain and the Monitoring and Optimization (M+O) domain. The CPC domain handles deterministic plant operations based on traditional process control systems. The M+O domain focuses on industry 4.0 monitoring and optimization tasks, split into plant-specific and central functions.The plant-specific functions are located on premises of each plant. The central functions are deployed in the cloud and connected to the plant specific functions of the various plants to aggregate the data in one place.

The UNS is described by Walker Reynolds as a framework where all applications and devices in Industrial IoT act as interconnected nodes, sharing and accessing data in a single unified location. Walker advocates for getting rid of the automation pyramid entirely, and making the UNS the governing system of the entire company.

But it does not have to be that extreme, and IT/OT architectures can also not be changed overnight. What we have seen often in practice is a "lite UNS" approach, where the traditional automation pyramid remains and the UNS is connected to each level of the automation pyramid to implement additional use-cases, that were not possible in the traditional automation pyramid.

![](/images/united-manufacturing-hub/UMH_UNS.png)
*The Unified Namespace Collects and Centralizes Data from the Automation Pyramid. Source: [The Rise of the Unified Namespace](https://learn.umh.app/lesson/chapter-2-the-rise-of-the-unified-namespace/).*

In the end, it’s up to the manufacturing company to decide how disruptive their transformation should be.

# A Highly Reliable IT Infrastructure

The NOA and UNS concepts were developed simultaneously but independently in the late 2010's. Whereas the UNS finds its origin in discrete manufacturing, NOA was developed by the chemical and pharmaceutical process industry. Nevertheless, both approaches yielded a remarkably similar IT infrastructure.

Both NOA and UNS implement their highly reliable IT infrastructure with mature technologies. For example, the UMH implemented its UNS using a combination of MQTT and Apache Kafka (Redpanda to be specific). This approach combines the lightweight communication via MQTT with the guaranteed data persistence of Apache Kafka. Furthermore, the UMH uses Kubernetes (k3s to be specific) to provide load balancing and failover, should a single device / server fail.

An additional option to scale is provided by the "layered scaling" feature of UMH. This means that instead of having a single message broker for the entire factory, each plant or sometimes even each production line will have its own message broker. With this approach, one can effectively split the load. This is not only a UMH feature, but also a widely accepted architecture for IIoT (see also this example from HiveMQ)

NOA, while stating "Highly Reliable IT Infrastructure," does not specify exactly how to achieve such an architecture. However, based on the wording in the remaining standard, such as "fast-changing IT components" and "innovative, open IT," it becomes clear that tools & techniques such as Docker, Kubernetes, MQTT, and Kafka were intended. If one looks carefully at the architecture, one can also discover a similar "layered architecture," where the plant-specific M+O handles different data than the Central M+O.

But what NOA is describing is how the communication should take place: Referring back to the Main NOA Building Blocks and their Interaction figure above, NOA Data flows from the CPC domain to the M+O domain via several communication channels using protocols like OPC UA. The key components of the NOA architecture consist of the NOA Diode for secure, unidirectional data transfer, the NOA Aggregating Server for consolidating data so that applications "only see one interface", and the NOA Information Model for standardizing data semantics.

This sounds very similar to the concept of a UNS or in general a message broker, where data coming from all different sources are standardized and then modeled in a shared topic hierarchy.

For communication from NOA to the automation pyramid, NOA implements a “Verification of Request” module. This additional verification is critical because operating on the automation pyramid means interacting with the physical world.

Coming back to the UNS: Data communication from the UNS to the automation pyramid for control applications is also possible. To guarantee the required additional security, the UMH filed a patent for a verification system with the same purpose as the NOA’s “Verification of Request” module.

# Applicable to Operate in a Conservative Industry

In the end, the UNS was developed in the United States as a solution to concrete problems in discrete manufacturing. NOA was designed for the chemical and pharmaceutical process industries that put an extreme focus on safety of personnel and minimizing risk of production interruption.

It should come as no surprise that the original idea of the UNS is more disruptive than NAMUR, and that also a lot of people fear the disruptiveness that a fully implemented UNS will do to established business models and architecture.

However, there is one advantage of leveraging a practical framework (such as the UNS) compared to a written standard: you can adopt it to your needs. And you can adopt it in such a way, that it is basically an implementation of NAMUR in practice, by ensuring that it is an extension of the automation pyramid as well as that it contains a verification of requests.

At the end of the day, it’s up to the user to configure the UNS. It can just as well be configured to operate in the same way as NOA.

# Conclusion

Although NOA and UNS evolved separately, their objectives are similar. Both architectures can  extend the automation pyramid by building a highly reliable IT infrastructure on top of the existing control systems. Although the objectives of the UNS are bolder than NOAs, the UNS can be adapted to fit the extremely conservative nature of the chemical and pharmaceutical industries. After all, both architectures put great care in minimizing potential production impact and safety risks. It's therefore fair to say that NAMUR Open Architecture and the Unified Namespace are truly two sides of the same coin. 
