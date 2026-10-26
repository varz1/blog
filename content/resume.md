---
title: "Resume"
menu: "main"
weight: 2
toc: false
---

# Li Chen

me@2rawzip.cc · [GitHub](https://github.com/varz1) · [LinkedIn](https://www.linkedin.com/in/li-chen-704794323/)

## Summary

Software engineer with 3+ years building and scaling customer-facing SaaS APIs and background-job systems in Golang and Python, with growing full-stack range across React and TypeScript. A product-first engineer who owns features end to end, from design and performance to deployment, along with the internal tooling around them, and who works directly with customers' engineers on their integration problems. Comfortable with CI/CD and on-call. Uses Claude Code daily.

## Skills

- **Databases:** MySQL, PostgreSQL, MongoDB, Redis, data modelling, query optimisation, schema design
- **APIs & Integration:** RESTful API design, API-Key/JWT authentication, third-party service integration
- **Data Pipelines:** Multi-stage workflow design, RabbitMQ message queuing, state-machine orchestration, data quality control
- **DevOps & Cloud:** Docker, Kubernetes (HPA / scheduling), GitLab CI, ArgoCD, Azure, Cloudflare Workers
- **Monitoring & Observability:** Prometheus, Grafana, OpenTelemetry (distributed tracing), structured logging
- **Version Control & Tooling:** Git, CI/CD pipelines, containerised deployment, Claude Code

## Work Experience

### Where is my money, a tracker for bills, shifts and payslips across employers

[bill-tracker.2rawzip.cc](https://bill-tracker.2rawzip.cc/) · May 2026 – Present

- Personal project: a pay tracker for casual workers with multiple employers, covering shifts (paid hours) and payslips (gross, tax, net, super).
- Implemented weekly pay analytics, calendar-synced rosters.

*Tech: TypeScript, React, Cloudflare Workers*

### Full-Stack Developer, Aivlike

Sep 2025 – Mar 2026

- Owned full-stack delivery of a cloud platform managing structured and media data for multiple business lines, from requirements through deployment.
- Designed a configurable multi-stage workflow engine coordinating LLM script generation, image generation and video synthesis for an AI short-drama product; each stage's provider is independently configurable.
- Built a unified multi-model abstraction layer so external image and video generation providers can be switched and A/B-compared on output quality by configuration alone; designed the async pipeline behind it (RabbitMQ + Redis) with priority queuing, real-time progress streaming and automated retry, sustaining 95%+ task success under concurrent load.
- Independently delivered full-stack user interfaces (React + REST API), established front-end coding standards and component libraries, and wrote procedural documentation and onboarding guides adopted across the team.
- Reduced infrastructure costs by 30% via object storage migration, async media-processing service redesign (disk isolation, auto-cleanup) and Docker deployment; introduced AI-assisted development (Claude Code) to the team and reviewed the generated code.

*Tech: Golang, Python, React, RabbitMQ, Redis, Docker*

### Software Development Engineer, JoggAI

Jun 2023 – Apr 2025

- Built the backend of an open platform exposing REST APIs with API-Key + JWT tenant isolation; supported 30K+ daily task calls at 500+ QPS, serving 20+ enterprise clients across authentication tiers and worked directly with clients' engineers on integration issues.
- Designed distributed task scheduling (RabbitMQ + Redis) with Kubernetes HPA scaling workers on queue-depth metrics, plus rate limiting and graceful degradation, maintaining 98% task success at peak load, cutting cloud costs by 30%.
- Led modular service decomposition: found the bottleneck (face-keypoint detection) with distributed tracing, extracted it from the monolith and introduced a Redis caching layer, reducing response time from 2 s to 400 ms and improving resource utilisation by 40%.
- Made avatar video generation 3x faster (about 3 minutes to 1) by learning the ML inference code stage by stage and switching the model input to single-channel greyscale, with no visible quality loss.
- Designed a progressive hot-update mechanism with version control and async recomputation, reducing the model release cycle from 1 week to instant deployment.
- Built a ticket-driven deployment workflow engine (React + Golang + MySQL) orchestrating request, approval, build and deploy; integrated GitLab CI + ArgoCD + Kubernetes for 100+ services with 10+ daily deployments, auto-generating Kubernetes manifests and pipeline configs.
- Built OpenTelemetry tracing and Prometheus + Grafana monitoring across 30+ microservices with integration standards and training (5× faster fault localisation); built a FastAPI + RabbitMQ middleware for 5 business units (new-service integration from 1 week to 3 days); set up code review and service templates for a 30+ engineer cross-timezone team.

*Tech: Golang, Python, FastAPI, React, RabbitMQ, Redis, MySQL, Kubernetes, GitLab CI, ArgoCD, OpenTelemetry, Prometheus, Grafana, Alibaba Cloud*

### Backend Developer, AMZ123.COM

Jul 2022 – May 2023

- Migrated the live user-authentication service from PHP to Golang (Gin) with a grey-scale rollout: response time from 900 ms to 400 ms for 10K+ DAU, with no downtime.
- Developed a JSON-driven site-building system with automated Nginx-based domain mapping, reducing new-site deployment from one week to one day.

*Tech: Golang (Gin), PHP, Redis, JWT, Nginx*

## Education

**B.S. in Software Engineering**, Xi'an Shiyou University, Xi'an, China · Sep 2018 – Jul 2022
