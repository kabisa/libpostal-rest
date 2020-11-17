[<img src="https://images.ctfassets.net/ede0ajjyowtx/uvtReubsCYyNXqiKaO4Fg/180842b35ff3d0d57836cf7083fb2328/kabisa_logo_two_color.svg" width="450" alt="Kabisa logo"/>][website]

# libpostal-rest [![Build Status][build_status_img]][build_status_link] [![Open Pull Requsts][prs_img]][prs_link] [![Go version][go_version_img]][go_version_url]


Kabisa's libpostal-rest is a fork from [johnlonganecker][johnlonganecker_profile_url]'s [libpostal-rest][libpostal_rest_url] project. It's a rest wrapper around the [Libpostal][libpostal_url] library.

This fork is specifically modified to support multiple addresses as input at once.

It's 100% Open Source and licensed under the [MIT](LICENSE).


## Usage
** Request ** 

```curl -X POST -d '["100 main st buffalo ny", "marconilaan 8 weert"]' localhost:8080/parser```


** Response **
```
[
  {
    "city": "buffalo",
    "house_number": "100",
    "road": "main st",
    "state": "ny"
  },
  {
    "city": "weert",
    "house_number": "8",
    "road": "marconilaan"
  }
]
```


## Available output tags
This projects uses libpostal's default outputs. Which can be found [here][libpostal_labels_url] 
```
house
category
near
house_number
road
unit
level
staircase
entrance
po_box
postcode
suburb
city_district
city
island
state_district
state
country_region
country
world_region
```


## Share the Love

Like this project? Please give it a ★ on [our GitHub][]! (it helps us **a lot**)

Are you using this project or any of our other projects? Consider sharing this project:
[<img align="right" title="Share via Email" src="https://images.ctfassets.net/ede0ajjyowtx/6FgtYsQxQy42f81BV5NVLb/86ada33c42037504add9c7f668434217/ios-email.svg"/>][share_email]
[<img align="right" title="Share on Twitter" src="https://images.ctfassets.net/ede0ajjyowtx/6d5a5dtEB77S4I1jXaZI2u/2a84b54a7b351a061e0bd5826052aaa6/social-twitter.svg" />][share_twitter]
[<img align="right" title="Share on LinkedIn" src="https://images.ctfassets.net/ede0ajjyowtx/4YEBKx16jYGABWjhBmO0x3/d4384b9e3088d39ca6bd4b5d8ba8f6a0/social-linkedin.svg" />][share_linkedin]
[<img align="right" title="Share on Facebook" src="https://images.ctfassets.net/ede0ajjyowtx/6NQy3vGRHYgTpi4geq6mVF/f3acf7286c7accb408e9deb8a0b6f4c2/social-facebook.svg" />][share_facebook]



## Help

**Got a question?**

Send us an [email][contact].


## Support

At Kabisa we believe in the power of Software Development in combination with Infrastructure as Code. Our DevOps Engineers are AWS certified and as a result of our expertise and experience we are official AWS partner Standard.

Struggling with Software Development our just need an extra hand? Contact us  at:

[![E-Mail](https://img.shields.io/badge/email-sales@kabisa.nl-blue.svg)](mailto:sales@kabisa.nl)



## Contributing

### Developing

If you are interested in being a contributor and want to get involved in developing this project or [help out](https://cpco.io/help-out) with our other projects, we would love to hear from you! Shoot us an [email][contact].

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull Request** so that we can review your changes

**NOTE:** Be sure to merge the latest changes from "upstream" before making a pull request!


## Copyright

Copyright © 2019 [Kabisa B.V][website]


## License

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

See [LICENSE](LICENSE) for full details.

## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## About

This project is maintained and funded by [Kabisa B.V][website]. Like it? Please let us know by [leaving a comment][contact]!

[<img src="https://images.ctfassets.net/ede0ajjyowtx/uvtReubsCYyNXqiKaO4Fg/180842b35ff3d0d57836cf7083fb2328/kabisa_logo_two_color.svg" width="450" alt="Kabisa logo"/>][website]



  [logo]: https://images.ctfassets.net/ede0ajjyowtx/uvtReubsCYyNXqiKaO4Fg/180842b35ff3d0d57836cf7083fb2328/kabisa_logo_two_color.svg
  [website]: https://kabisa.nl
  [build_status_img]: https://github.com/kabisa/libpostal-rest/workflows/Docker/badge.svg
  [build_status_link]: https://github.com/kabisa/libpostal-rest/actions?query=workflow%3ADocker
  [prs_img]: https://img.shields.io/github/issues-pr/kabisa/libpostal-rest
  [prs_link]: https://github.com/kabisa/libpostal-rest/pulls
  [terraform_version_logo]: https://img.shields.io/static/v1?label=Terraform%20version&message=v0.12.9&color=5C4EE5&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAjCAMAAADCMPhoAAAAAXNSR0IB2cksfwAAAAlwSFlzAAAWJQAAFiUBSVIk8AAAAltQTFRFX0PpX0PpX0PpAAAAX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpQECyQECyQECyX0PpX0PpX0PpX0PpX0PpX0PpQECyQECyQECyQECyX0PpX0PpX0PpX0PpX0PpX0PpQECyQECyQECyQECyX0PpX0PpX0PpX0PpX0PpX0PpQECyQECyQECyQECyQECyQECyQECyX0PpX0PpX0PpX0PpX0PpQECyQECyQECyQECyQECyQECyX0PpX0PpX0PpX0PpX0PoR0C+QECyQECyQECyQECyQECyX0PpX0PpX0PpX0PpX0PpX0PoR0C9QECyQECyQECyX0PpX0PpX0PpX0PpXkPoRkC9QECyQECyX0PpX0PpX0PpX0PpX0PpXkPoRkC9QECyX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpQECyQECyX0PpX0PpX0PpQECyQECyQECyX0PpX0PpX0PpQECyQECyQECyQECyQECyQECyX0PpX0PpX0PpX0PpX0PpQECyQECyQECyQECyQECyX0PpX0PpX0PpX0PpX0PpX0PpQECyQECyQECyQECyX0PpX0PpX0PpXkPoRkC9QECyQECyQECyX0PpX0PpX0PpX0PpXkPnRkC9QECyQECyX0PpX0PpWULfQ0C4X0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpEc+yhgAAAMl0Uk5TTR0FALjDdCIDyPHlu3Yu9//fok8TAezCi04L++q/cgwIAAMM+csfVSgJARE9WvrRKY1UIytirbby1IpHHgALJVaZ3fbB+P2HPhIEG0ia5f/1ymkZCAEKKozc+27a/vC3Tg5qzPcadc/zwUDh/gIRN3n8ykTqBxtSpw8wYZsNL1HE9bUK0PbwuWdchab87MiRShMQhoSv2PHNllQWydaOZXzp+t6qF2ia171C2Mtp9L1kRHIxbyLvuQQCusbFHKDZcbzmO+08lC1rS/7iJQAAAbtJREFUeJxjYGBkYsYHGFhY2dg58Cng5OLm4eXDbQoDJ78Av6CQsIgoHgUCAmLiEpJS+BQISMvIyskrYJiiqKQMVSAgoKKqpq6hiapES1tHF65AT9+AxdDIWAFJWtnE1MwcWYGqhaWVtY2CLUTazt7B0cnZBUWBq4CbpbuHJ8geL28fXz9/f6AC2QBkBUC3BAYFh4SGhUdERvmDFUTHqMQiKxCIjYtPSExKTvH3hyhQSE1Ld0VWIBCbkZmVHZUDU8Ccm5dfEFiIpEDAtai4xN8froDZtrSsvEIMjwJmZtHKquoaHjwKgEpq6+rLGvgxFDQ2McDCTbS0uaClFVVBTlt7B1wBUEVnV7e+BUJBT29f/4SJSAomVUyOnjJ1WgBUwfQZM2fNBkY3koI5GXPnzV/AspAfqGDR4iW6S7WY0RQA40J8Wf3yFStXrV6z1lsLkmBQFQgIrFu/YeOmzVu2esFSFLoCgdht28t37NRSxKlAINZilzwiZWFRIOC6u5ZGCir3EFCgsAAWF9gV2Irunb9vvytuBSBDGA8cPKSCRwEzc+lhK84j/HgUMDNLHT0WswufAmZmheMnmhEKAKMnrgvDKLJtAAAAAElFTkSuQmCC
  [terraform_version_url]: https://github.com/hashicorp/terraform/blob/master/CHANGELOG.md#0129-september-17-2019
  [go_version_img]: https://img.shields.io/badge/Go-v1.15-blue
  [go_version_url]: https://github.com/docker-library/golang/blob/071e264f53e89ea75f1a38f6c1c33641685d8560/1.15/alpine3.12/Dockerfile
  [johnlonganecker_profile_url]: https://github.com/johnlonganecker
  [libpostal_rest_url]: https://github.com/johnlonganecker/libpostal-rest
  [libpostal_url]: https://github.com/openvenues/libpostal
  [libpostal_labels_url]: https://github.com/openvenues/libpostal#parser-labels
  [contact]: https://www.kabisa.nl/contact/
  [share_twitter]: https://twitter.com/intent/tweet/?text=libpostal-rest&url=https://github.com/kabisa/libpostal-rest
  [share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=libpostal-rest&url=https://github.com/kabisa/libpostal-rest
  [share_reddit]: https://reddit.com/submit/?url=https://github.com/kabisa/libpostal-rest
  [share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/kabisa/libpostal-rest
  [share_email]: mailto:?subject=libpostal-rest&body=https://github.com/kabisa/libpostal-rest
