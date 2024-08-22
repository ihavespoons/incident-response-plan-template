# Incident Response Plan Template

## About

The original version of this template was developed by [Counteractive Security](https://www.counteractive.net). This is just me picking up where they left modernising the stack slightly and making this something that is usable currently.

Download the latest release [here](https://github.com/ihavespoons/incident-response-plan-template/releases/latest), a please create an issue or submit a pull request with any feedback, suggestions, or updates.

## Instructions

### Download or fork this template

The layout is as follows:

* `during.md`: the core of the plan, actions taken during an incident response.
* `playbooks/`: a folder containing playbooks with investigation, remediation, and communication suggestions for specific incidents.  Create playbooks for any incidents that are highly likely or highly damaging for your organization.  `playbooks/index.md` contains the playbook section header content, and each playbook should follow the convention `playbooks/playbook-[THREAT].md`.
* `roles/`: a folder containing descriptions of each role in the plan, along with duties and training notes.  `index.md` contains the roles section header content, and each role should follow the convention `playbooks/role-[ORDER]-[NAME].md`.
* `after.md`: the guide to after-action review (_a.k.a._, hotwash, debrief, or post-mortem)---actions taken after an incident response.
* `about.md`: a footer containing information about the plan/template as a whole.
* `info.yml`: a file containing values for the template strings throughout the plan (see below)

### Fill `info.yml` with your organization's information

The template files have a lot of placeholders that `{{LOOK_LIKE_THIS}}`.  The purpose of each placeholder should be discernable from context, and the [default `info.yml` file](./info.yml) is commented for additional clarity.  This is the [mustache](https://mustache.github.io/) template syntax, and has wide support in a variety of tools and languages.  

The easiest way to replace these variables is to customize the `info.yml` file with your organization's information and use the provided [Makefile](https://en.wikipedia.org/wiki/Make_(software)) (as of v1.0.0) to automatically find and replace all the relevant strings.  _NOTE:_ this requires `make` (naturally), `mustache`, and `pandoc` to be installed and available in the user's `$PATH`.  _NOTE:_ pdf output needs `pdflatex` (see [this gist](https://gist.github.com/rain1024/98dd5e2c6c8c28f9ea9d) for instructions on Ubuntu/Debian), and you'll need `git` if you want to clone the repository rather than download the zipped source.

If you don't have the information or tools referenced in the template variables, that's definitely worth fixing.  **Especially** the critical information list (data you want to protect) and critical asset list (systems you want to protect).

### Build the template
To get started you need to have:
  - Docker
  - [Task](https://taskfile.dev/)

On any system that runs docker simply run:
```bash 
    task 
```
This merges the template components, combines them with your custom data from `info.yml`, and outputs all supported formats in the `public/` directory.  That's it!

*If you have a specific case and want more details, read on!*

### Further customize the plan

1. Fill in any remaining template variables (the strings that `{{LOOK_LIKE_THIS}}`).
1. Review all the `TODO` prompts for likely areas to customize, if desired.  Delete them if no changes are required.
1. Add any roles or playbooks relevant to your organization. These can also be added over time.
1. Customize anything else!  Whatever you feel is most effective for your organization.
1. _Optional:_ Customize formatting directly or [using pandoc's options](https://learnbyexample.github.io/customizing-pandoc/).  The default Makefile uses the default pandoc styles, and they're not for everyone.

### Deploy and use the plan

The Taskfile uses Docker & [pandoc](https://pandoc.org) to create a variety of formats, or you can use the markdown files with [mkdocs](http://www.mkdocs.org/), [hugo](https://gohugo.io/), or countless other platforms.

### Examples

Examples in each format are available in [the examples directory](./examples).  The [markdown version](./examples/plan.md) is a good place to start, rendered from markdown to html automatically by github.

## License

This template is provided under the Apache License, version 2.0.  See the [LICENSE](./LICENSE) and [NOTICE](./NOTICE) files for additional information.

## References and Additional Reading

* [Awesome Incident Response](https://github.com/meirwah/awesome-incident-response)
* [NIST Computer Security Incident Handling Guide](http://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-61r2.pdf) (NIST)
* [CERT Societe Generale Incident Response Methodologies](https://github.com/certsocietegenerale/IRM/tree/master/EN)
* [Incident Handler's Handbook](https://www.sans.org/reading-room/whitepapers/incident/incident-handlers-handbook-33901) (SANS)
* [Technical Approaches to Uncovering and Remediating Malicious Activity](https://us-cert.cisa.gov/ncas/alerts/aa20-245a) (Cybersecurity and Infrastructure Security Agency (CISA))
* [Responding to IT Security Incidents](https://technet.microsoft.com/en-us/library/cc700825.aspx) (Microsoft)
* [Defining Incident Management Processes for CSIRTs: A Work in Progress](http://resources.sei.cmu.edu/library/asset-view.cfm?assetid=7153) (CMU)
* [Creating and Managing Computer Security Incident Handling Teams (CSIRTS)](https://www.first.org/conference/2008/papers/killcrece-georgia-slides.pdf) (CERT)
* [Incident Management for Operations](http://shop.oreilly.com/product/0636920036159.do) (Rob Schnepp, Ron Vidal, Chris Hawley)
* [_Incident Response & Computer Forensics, Third Edition_](http://a.co/cUkFzMh) (Jason Luttgens. Matthew Pepe. Kevin Mandia)
* [_Incident Response_](http://shop.oreilly.com/product/9780596001308.do) (Kenneth R. van Wyk, Richard Forno)
* [The Checklist Manifesto](http://atulgawande.com/book/the-checklist-manifesto/) (Atul Gawande)
* [The Field Guide to Understanding Human Error](https://www.amazon.com/Field-Guide-Understanding-Human-Error/dp/0754648265) (Sidney Dekker)
* [Normal Accidents: Living with High-Risk Technologies](https://www.amazon.com/Normal-Accidents-Living-High-Risk-Technologies/dp/0691004129) (Charles Perrow)
* [Site Reliability Engineering](https://landing.google.com/sre/book.html) (Google)
* [Debriefing Facilitation Guide](http://extfiles.etsy.com/DebriefingFacilitationGuide.pdf) (Etsy)
* [Every Minute Counts: Leading Heroku's Incident Response](https://www.heavybit.com/library/video/every-minute-counts-coordinating-herokus-incident-response/) (Blake Gentry)
* [Three Analytical Traps in Accident Investigation](https://www.youtube.com/watch?v=TqaFT-0cY7U) (Dr. Johan Bergström)
* [US National Incident Management System (NIMS)](https://www.fema.gov/national-incident-management-system) (FEMA)
* [Informed's NIMS Incident Command System Field Guide](https://www.amazon.com/gp/product/1284038408) (Michael J. Ward)
* [PagerDuty IR Docs](https://response.pagerduty.com/)
* [NIST 800-61r2](http://nvlpubs.nist.gov/nistpubs/SpecialPublications/NIST.SP.800-61r2.pdf)
* [NIST CSF](https://www.nist.gov/cyberframework)
* [CSO Online 10 Steps](https://www.csoonline.com/article/3203705/security/10-steps-for-a-successful-incident-response-plan.html) (June 2017) and [CSO Online 9 Steps](https://www.csoonline.com/article/3099684/disaster-recovery/9-steps-for-a-successful-incident-response-plan.html) (July 2016)
* [SecurityMetrics blog 6 Steps to Making an IR Plan](http://blog.securitymetrics.com/2017/01/6-steps-to-making-incident-response-plan.html)
* [Cal Berkeley IR Plan Development](https://security.berkeley.edu/incident-response-planning-guideline)
* [EPA IR Plan](https://www.epa.gov/sites/production/files/2016-01/documents/cio_2150-p-08.2.pdf)
* [incidentresponse.com playbooks](https://www.incidentresponse.com/playbooks/)

## Roadmap

See [issues](https://github.com/counteractive/incident-response-plan-template/issues) list.

## Changelog

See [releases](https://github.com/counteractive/incident-response-plan-template/releases) page.
