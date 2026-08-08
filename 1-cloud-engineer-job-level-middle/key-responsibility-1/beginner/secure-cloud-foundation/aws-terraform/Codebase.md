# Staff Canteen Management System

Generated: 08/07/2026 22:32:25

---

## Table of Contents

- .terraform.lock.hcl
- .terraform\providers\registry.terraform.io\hashicorp\aws\5.100.0\windows_amd64\LICENSE.txt
- .terraform\providers\registry.terraform.io\hashicorp\local\2.9.0\windows_amd64\LICENSE.txt
- .terraform\providers\registry.terraform.io\hashicorp\random\3.9.0\windows_amd64\LICENSE.txt
- .terraform\providers\registry.terraform.io\hashicorp\tls\4.3.0\windows_amd64\LICENSE.txt
- code base.docx
- jubilee-cloud-foundation-key.pem
- main.tf
- outputs.tf
- terraform.tfstate
- terraform.tfstate.backup
- terraform.tfvars
- variables.tf
- web_user_data.sh

---


<div style='page-break-after: always;'></div>

# File: .terraform.lock.hcl

```hcl
# This file is maintained automatically by "terraform init".
# Manual edits may be lost in future updates.

provider "registry.terraform.io/hashicorp/aws" {
  version     = "5.100.0"
  constraints = "~> 5.0"
  hashes = [
    "h1:H3mU/7URhP0uCRGK8jeQRKxx2XFzEqLiOq/L2Bbiaxs=",
    "zh:054b8dd49f0549c9a7cc27d159e45327b7b65cf404da5e5a20da154b90b8a644",
    "zh:0b97bf8d5e03d15d83cc40b0530a1f84b459354939ba6f135a0086c20ebbe6b2",
    "zh:1589a2266af699cbd5d80737a0fe02e54ec9cf2ca54e7e00ac51c7359056f274",
    "zh:6330766f1d85f01ae6ea90d1b214b8b74cc8c1badc4696b165b36ddd4cc15f7b",
    "zh:7c8c2e30d8e55291b86fcb64bdf6c25489d538688545eb48fd74ad622e5d3862",
    "zh:99b1003bd9bd32ee323544da897148f46a527f622dc3971af63ea3e251596342",
    "zh:9b12af85486a96aedd8d7984b0ff811a4b42e3d88dad1a3fb4c0b580d04fa425",
    "zh:9f8b909d3ec50ade83c8062290378b1ec553edef6a447c56dadc01a99f4eaa93",
    "zh:aaef921ff9aabaf8b1869a86d692ebd24fbd4e12c21205034bb679b9caf883a2",
    "zh:ac882313207aba00dd5a76dbd572a0ddc818bb9cbf5c9d61b28fe30efaec951e",
    "zh:bb64e8aff37becab373a1a0cc1080990785304141af42ed6aa3dd4913b000421",
    "zh:dfe495f6621df5540d9c92ad40b8067376350b005c637ea6efac5dc15028add4",
    "zh:f0ddf0eaf052766cfe09dea8200a946519f653c384ab4336e2a4a64fdd6310e9",
    "zh:f1b7e684f4c7ae1eed272b6de7d2049bb87a0275cb04dbb7cda6636f600699c9",
    "zh:ff461571e3f233699bf690db319dfe46aec75e58726636a0d97dd9ac6e32fb70",
  ]
}

provider "registry.terraform.io/hashicorp/local" {
  version     = "2.9.0"
  constraints = "~> 2.5"
  hashes = [
    "h1:px3Hpv/tL288wzu5knHywTTBcrydLnnGEiF/NIQBaRs=",
    "zh:0baa4566cf77f1ff52f4293d1c8536202dd23edc197c3196413a28343c3ac3a0",
    "zh:16b5559c3c07088ddad11a9bb9e9c0799999363c2958e9a5be2bcbbf2cd9ca64",
    "zh:197c79015a10d1cce904a8ea722cbc750c42aeae2da53f44a6a0751d9fd1aa90",
    "zh:29d0b03e5343a80677ebfeb2e2c31cbe4b1f65e736e53417454a4277fec2544c",
    "zh:4896bfa6cf1d2fd562b47ef2e87f47862ae92a04f8ad5d764380f0c6653473b8",
    "zh:531f8529cbca49f681883e57761a05a8398afaef6d1ab0d205d26bf12f4428e8",
    "zh:6aaf5011d83161c86d2bfb80c0923ec934e578288758da2f37acb7aec129004b",
    "zh:7430275253d3d3c40aa6179e0ec0d63212874dbbc06c5a51b9d07ec590f9756c",
    "zh:78d5eefdd9e494defcb3c68d282b8f96630502cac21d1ea161f53cfe9bb483b3",
    "zh:be17dc611e95e26cdf6cad79dfccf1064f0e32032a2efeb939a9bbe7fb1cbfe9",
    "zh:f0e3b0aa644202e1d79d2000dca91f6019425da71e9800fa23f27e51c034f195",
    "zh:f62bae4519e4ead49182ddc8afe8cf61e2a4c3ba3973b0fbba967736a2696aa3",
    "zh:fcafa360a5b0b96244f26f4e3a6d642b716a376557142c2442ff2fb12d11da18",
  ]
}

provider "registry.terraform.io/hashicorp/random" {
  version     = "3.9.0"
  constraints = "~> 3.6"
  hashes = [
    "h1:q/uaUTBdKgAmZESrwsoeDQff9uUA/cI/N5ZKNgVwa9c=",
    "zh:161ad0bd9a75768c82f53fb6e7172a9d8be2d4889b012645a34795031aaf1bf1",
    "zh:19dc9a5b17729725ccfc4f45b0500af0ee5bc6b6b160c7adb8f2bf617d2c80ea",
    "zh:269eda8fe42daa7974d5a34d166c3ba9defe80cde86c01e4dadcfdf2e1f05e5f",
    "zh:373f7c65566f8f2cc7f45d698654feb9d988996957e1266a69ca00c52d6d16d0",
    "zh:5599d16804c41c83009ec621b6d6b6f74e102f5827678a4750f8809055546b61",
    "zh:583be0440469a22bff70dcfa56593b01566860b29607437264adb51060cf46fc",
    "zh:5f211d8ec3f2e1f414870d9584bfe26e6995560ef81c748f8447a48164767398",
    "zh:78d5eefdd9e494defcb3c68d282b8f96630502cac21d1ea161f53cfe9bb483b3",
    "zh:7b547fd16216761ef86efc3ed516ac5ac0c5c42b7c7eb24a08cef2d93f69ed5e",
    "zh:7e7c0679daf2a382151d05068c8c3f0dae6b7b7dccf818827b73dd08638df2ef",
    "zh:8089dec888a8038b9b4fb23b3df7e1057293dbc5b60b42cc47ff690d69d4b61b",
    "zh:c51f15a031edfd6f23ce8ced3446ca7f8d8d647e2499890d7d5d10d5016d7257",
    "zh:c94784f005708890dc6895afd53636ec00ec1e430b15d41e5aebfb1d4b39bd04",
  ]
}

provider "registry.terraform.io/hashicorp/tls" {
  version     = "4.3.0"
  constraints = "~> 4.0"
  hashes = [
    "h1:7QWrBlzkkFAFyDl9UsfC0tdfNFquFx03miHwZcta33Q=",
    "zh:0ab58d6f8991d436c7d2dbd89ed814709b949b07ac5a54ee53b0aec1fa772a8b",
    "zh:60b347abcb56f45d97c56f14d895069cd15a83993f199777f571b79fea3642ee",
    "zh:6889be32640349230de3f23856e6f04e0e9ced4a84a27d3f552fa54684448218",
    "zh:73f8e1ecf7135033165fb14b7e8bf4d656f3ce13065ec35762ea0481975328c7",
    "zh:94ce25ee253eca0b42cae9c856b36bca8103b6453012d1b279c3623c805f2d42",
    "zh:96bc6de9fd67bc446fd11257872e1ffb1029a996ed1d65a3f6b43f6d408ad9ab",
    "zh:97c609a310a51bfd504d704e036d72064a84bf0bdb36cc08cd4cc66098212b41",
    "zh:a12c16e94533c5bd123f75032576b9dc91dd5d5ccd5f7cf331d0f2e1adc55cf8",
    "zh:c4f014f876adf7af57188795050bda5b0029d8c7d7773031102b6c36dcf1fc21",
    "zh:d9b0a21583aaa3df3a95394fb949a3c515ff71c2ff5a1fc4a73d364aa90bfca5",
    "zh:da510d22f0c6d71ad19a76406f106b782448f512375787ecfabb338ed1e311a7",
    "zh:f0e9447a9ce3a24cdaa113089e65663c836d8b9bfdb915a1c0284e0112cab5c0",
    "zh:f569b65999264a9416862bca5cd2a6177d94ccb0424f3a4ef424428912b9cb3c",
  ]
}

```


<div style='page-break-after: always;'></div>

# File: .terraform\providers\registry.terraform.io\hashicorp\aws\5.100.0\windows_amd64\LICENSE.txt

```txt
Copyright (c) 2017 HashiCorp, Inc.

Mozilla Public License Version 2.0
==================================

1. Definitions
--------------

1.1. "Contributor"
    means each individual or legal entity that creates, contributes to
    the creation of, or owns Covered Software.

1.2. "Contributor Version"
    means the combination of the Contributions of others (if any) used
    by a Contributor and that particular Contributor's Contribution.

1.3. "Contribution"
    means Covered Software of a particular Contributor.

1.4. "Covered Software"
    means Source Code Form to which the initial Contributor has attached
    the notice in Exhibit A, the Executable Form of such Source Code
    Form, and Modifications of such Source Code Form, in each case
    including portions thereof.

1.5. "Incompatible With Secondary Licenses"
    means

    (a) that the initial Contributor has attached the notice described
        in Exhibit B to the Covered Software; or

    (b) that the Covered Software was made available under the terms of
        version 1.1 or earlier of the License, but not also under the
        terms of a Secondary License.

1.6. "Executable Form"
    means any form of the work other than Source Code Form.

1.7. "Larger Work"
    means a work that combines Covered Software with other material, in
    a separate file or files, that is not Covered Software.

1.8. "License"
    means this document.

1.9. "Licensable"
    means having the right to grant, to the maximum extent possible,
    whether at the time of the initial grant or subsequently, any and
    all of the rights conveyed by this License.

1.10. "Modifications"
    means any of the following:

    (a) any file in Source Code Form that results from an addition to,
        deletion from, or modification of the contents of Covered
        Software; or

    (b) any new file in Source Code Form that contains any Covered
        Software.

1.11. "Patent Claims" of a Contributor
    means any patent claim(s), including without limitation, method,
    process, and apparatus claims, in any patent Licensable by such
    Contributor that would be infringed, but for the grant of the
    License, by the making, using, selling, offering for sale, having
    made, import, or transfer of either its Contributions or its
    Contributor Version.

1.12. "Secondary License"
    means either the GNU General Public License, Version 2.0, the GNU
    Lesser General Public License, Version 2.1, the GNU Affero General
    Public License, Version 3.0, or any later versions of those
    licenses.

1.13. "Source Code Form"
    means the form of the work preferred for making modifications.

1.14. "You" (or "Your")
    means an individual or a legal entity exercising rights under this
    License. For legal entities, "You" includes any entity that
    controls, is controlled by, or is under common control with You. For
    purposes of this definition, "control" means (a) the power, direct
    or indirect, to cause the direction or management of such entity,
    whether by contract or otherwise, or (b) ownership of more than
    fifty percent (50%) of the outstanding shares or beneficial
    ownership of such entity.

2. License Grants and Conditions
--------------------------------

2.1. Grants

Each Contributor hereby grants You a world-wide, royalty-free,
non-exclusive license:

(a) under intellectual property rights (other than patent or trademark)
    Licensable by such Contributor to use, reproduce, make available,
    modify, display, perform, distribute, and otherwise exploit its
    Contributions, either on an unmodified basis, with Modifications, or
    as part of a Larger Work; and

(b) under Patent Claims of such Contributor to make, use, sell, offer
    for sale, have made, import, and otherwise transfer either its
    Contributions or its Contributor Version.

2.2. Effective Date

The licenses granted in Section 2.1 with respect to any Contribution
become effective for each Contribution on the date the Contributor first
distributes such Contribution.

2.3. Limitations on Grant Scope

The licenses granted in this Section 2 are the only rights granted under
this License. No additional rights or licenses will be implied from the
distribution or licensing of Covered Software under this License.
Notwithstanding Section 2.1(b) above, no patent license is granted by a
Contributor:

(a) for any code that a Contributor has removed from Covered Software;
    or

(b) for infringements caused by: (i) Your and any other third party's
    modifications of Covered Software, or (ii) the combination of its
    Contributions with other software (except as part of its Contributor
    Version); or

(c) under Patent Claims infringed by Covered Software in the absence of
    its Contributions.

This License does not grant any rights in the trademarks, service marks,
or logos of any Contributor (except as may be necessary to comply with
the notice requirements in Section 3.4).

2.4. Subsequent Licenses

No Contributor makes additional grants as a result of Your choice to
distribute the Covered Software under a subsequent version of this
License (see Section 10.2) or under the terms of a Secondary License (if
permitted under the terms of Section 3.3).

2.5. Representation

Each Contributor represents that the Contributor believes its
Contributions are its original creation(s) or it has sufficient rights
to grant the rights to its Contributions conveyed by this License.

2.6. Fair Use

This License is not intended to limit any rights You have under
applicable copyright doctrines of fair use, fair dealing, or other
equivalents.

2.7. Conditions

Sections 3.1, 3.2, 3.3, and 3.4 are conditions of the licenses granted
in Section 2.1.

3. Responsibilities
-------------------

3.1. Distribution of Source Form

All distribution of Covered Software in Source Code Form, including any
Modifications that You create or to which You contribute, must be under
the terms of this License. You must inform recipients that the Source
Code Form of the Covered Software is governed by the terms of this
License, and how they can obtain a copy of this License. You may not
attempt to alter or restrict the recipients' rights in the Source Code
Form.

3.2. Distribution of Executable Form

If You distribute Covered Software in Executable Form then:

(a) such Covered Software must also be made available in Source Code
    Form, as described in Section 3.1, and You must inform recipients of
    the Executable Form how they can obtain a copy of such Source Code
    Form by reasonable means in a timely manner, at a charge no more
    than the cost of distribution to the recipient; and

(b) You may distribute such Executable Form under the terms of this
    License, or sublicense it under different terms, provided that the
    license for the Executable Form does not attempt to limit or alter
    the recipients' rights in the Source Code Form under this License.

3.3. Distribution of a Larger Work

You may create and distribute a Larger Work under terms of Your choice,
provided that You also comply with the requirements of this License for
the Covered Software. If the Larger Work is a combination of Covered
Software with a work governed by one or more Secondary Licenses, and the
Covered Software is not Incompatible With Secondary Licenses, this
License permits You to additionally distribute such Covered Software
under the terms of such Secondary License(s), so that the recipient of
the Larger Work may, at their option, further distribute the Covered
Software under the terms of either this License or such Secondary
License(s).

3.4. Notices

You may not remove or alter the substance of any license notices
(including copyright notices, patent notices, disclaimers of warranty,
or limitations of liability) contained within the Source Code Form of
the Covered Software, except that You may alter any license notices to
the extent required to remedy known factual inaccuracies.

3.5. Application of Additional Terms

You may choose to offer, and to charge a fee for, warranty, support,
indemnity or liability obligations to one or more recipients of Covered
Software. However, You may do so only on Your own behalf, and not on
behalf of any Contributor. You must make it absolutely clear that any
such warranty, support, indemnity, or liability obligation is offered by
You alone, and You hereby agree to indemnify every Contributor for any
liability incurred by such Contributor as a result of warranty, support,
indemnity or liability terms You offer. You may include additional
disclaimers of warranty and limitations of liability specific to any
jurisdiction.

4. Inability to Comply Due to Statute or Regulation
---------------------------------------------------

If it is impossible for You to comply with any of the terms of this
License with respect to some or all of the Covered Software due to
statute, judicial order, or regulation then You must: (a) comply with
the terms of this License to the maximum extent possible; and (b)
describe the limitations and the code they affect. Such description must
be placed in a text file included with all distributions of the Covered
Software under this License. Except to the extent prohibited by statute
or regulation, such description must be sufficiently detailed for a
recipient of ordinary skill to be able to understand it.

5. Termination
--------------

5.1. The rights granted under this License will terminate automatically
if You fail to comply with any of its terms. However, if You become
compliant, then the rights granted under this License from a particular
Contributor are reinstated (a) provisionally, unless and until such
Contributor explicitly and finally terminates Your grants, and (b) on an
ongoing basis, if such Contributor fails to notify You of the
non-compliance by some reasonable means prior to 60 days after You have
come back into compliance. Moreover, Your grants from a particular
Contributor are reinstated on an ongoing basis if such Contributor
notifies You of the non-compliance by some reasonable means, this is the
first time You have received notice of non-compliance with this License
from such Contributor, and You become compliant prior to 30 days after
Your receipt of the notice.

5.2. If You initiate litigation against any entity by asserting a patent
infringement claim (excluding declaratory judgment actions,
counter-claims, and cross-claims) alleging that a Contributor Version
directly or indirectly infringes any patent, then the rights granted to
You by any and all Contributors for the Covered Software under Section
2.1 of this License shall terminate.

5.3. In the event of termination under Sections 5.1 or 5.2 above, all
end user license agreements (excluding distributors and resellers) which
have been validly granted by You or Your distributors under this License
prior to termination shall survive termination.

************************************************************************
*                                                                      *
*  6. Disclaimer of Warranty                                           *
*  -------------------------                                           *
*                                                                      *
*  Covered Software is provided under this License on an "as is"       *
*  basis, without warranty of any kind, either expressed, implied, or  *
*  statutory, including, without limitation, warranties that the       *
*  Covered Software is free of defects, merchantable, fit for a        *
*  particular purpose or non-infringing. The entire risk as to the     *
*  quality and performance of the Covered Software is with You.        *
*  Should any Covered Software prove defective in any respect, You     *
*  (not any Contributor) assume the cost of any necessary servicing,   *
*  repair, or correction. This disclaimer of warranty constitutes an   *
*  essential part of this License. No use of any Covered Software is   *
*  authorized under this License except under this disclaimer.         *
*                                                                      *
************************************************************************

************************************************************************
*                                                                      *
*  7. Limitation of Liability                                          *
*  --------------------------                                          *
*                                                                      *
*  Under no circumstances and under no legal theory, whether tort      *
*  (including negligence), contract, or otherwise, shall any           *
*  Contributor, or anyone who distributes Covered Software as          *
*  permitted above, be liable to You for any direct, indirect,         *
*  special, incidental, or consequential damages of any character      *
*  including, without limitation, damages for lost profits, loss of    *
*  goodwill, work stoppage, computer failure or malfunction, or any    *
*  and all other commercial damages or losses, even if such party      *
*  shall have been informed of the possibility of such damages. This   *
*  limitation of liability shall not apply to liability for death or   *
*  personal injury resulting from such party's negligence to the       *
*  extent applicable law prohibits such limitation. Some               *
*  jurisdictions do not allow the exclusion or limitation of           *
*  incidental or consequential damages, so this exclusion and          *
*  limitation may not apply to You.                                    *
*                                                                      *
************************************************************************

8. Litigation
-------------

Any litigation relating to this License may be brought only in the
courts of a jurisdiction where the defendant maintains its principal
place of business and such litigation shall be governed by laws of that
jurisdiction, without reference to its conflict-of-law provisions.
Nothing in this Section shall prevent a party's ability to bring
cross-claims or counter-claims.

9. Miscellaneous
----------------

This License represents the complete agreement concerning the subject
matter hereof. If any provision of this License is held to be
unenforceable, such provision shall be reformed only to the extent
necessary to make it enforceable. Any law or regulation which provides
that the language of a contract shall be construed against the drafter
shall not be used to construe this License against a Contributor.

10. Versions of the License
---------------------------

10.1. New Versions

Mozilla Foundation is the license steward. Except as provided in Section
10.3, no one other than the license steward has the right to modify or
publish new versions of this License. Each version will be given a
distinguishing version number.

10.2. Effect of New Versions

You may distribute the Covered Software under the terms of the version
of the License under which You originally received the Covered Software,
or under the terms of any subsequent version published by the license
steward.

10.3. Modified Versions

If you create software not governed by this License, and you want to
create a new license for such software, you may create and use a
modified version of this License if you rename the license and remove
any references to the name of the license steward (except to note that
such modified license differs from this License).

10.4. Distributing Source Code Form that is Incompatible With Secondary
Licenses

If You choose to distribute Source Code Form that is Incompatible With
Secondary Licenses under the terms of this version of the License, the
notice described in Exhibit B of this License must be attached.

Exhibit A - Source Code Form License Notice
-------------------------------------------

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.

If it is not possible or desirable to put the notice in a particular
file, then You may include the notice in a location (such as a LICENSE
file in a relevant directory) where a recipient would be likely to look
for such a notice.

You may add additional accurate notices of copyright ownership.

Exhibit B - "Incompatible With Secondary Licenses" Notice
---------------------------------------------------------

  This Source Code Form is "Incompatible With Secondary Licenses", as
  defined by the Mozilla Public License, v. 2.0.

```


<div style='page-break-after: always;'></div>

# File: .terraform\providers\registry.terraform.io\hashicorp\local\2.9.0\windows_amd64\LICENSE.txt

```txt
Copyright IBM Corp. 2017, 2026

Mozilla Public License Version 2.0
==================================

1. Definitions
--------------

1.1. "Contributor"
    means each individual or legal entity that creates, contributes to
    the creation of, or owns Covered Software.

1.2. "Contributor Version"
    means the combination of the Contributions of others (if any) used
    by a Contributor and that particular Contributor's Contribution.

1.3. "Contribution"
    means Covered Software of a particular Contributor.

1.4. "Covered Software"
    means Source Code Form to which the initial Contributor has attached
    the notice in Exhibit A, the Executable Form of such Source Code
    Form, and Modifications of such Source Code Form, in each case
    including portions thereof.

1.5. "Incompatible With Secondary Licenses"
    means

    (a) that the initial Contributor has attached the notice described
        in Exhibit B to the Covered Software; or

    (b) that the Covered Software was made available under the terms of
        version 1.1 or earlier of the License, but not also under the
        terms of a Secondary License.

1.6. "Executable Form"
    means any form of the work other than Source Code Form.

1.7. "Larger Work"
    means a work that combines Covered Software with other material, in
    a separate file or files, that is not Covered Software.

1.8. "License"
    means this document.

1.9. "Licensable"
    means having the right to grant, to the maximum extent possible,
    whether at the time of the initial grant or subsequently, any and
    all of the rights conveyed by this License.

1.10. "Modifications"
    means any of the following:

    (a) any file in Source Code Form that results from an addition to,
        deletion from, or modification of the contents of Covered
        Software; or

    (b) any new file in Source Code Form that contains any Covered
        Software.

1.11. "Patent Claims" of a Contributor
    means any patent claim(s), including without limitation, method,
    process, and apparatus claims, in any patent Licensable by such
    Contributor that would be infringed, but for the grant of the
    License, by the making, using, selling, offering for sale, having
    made, import, or transfer of either its Contributions or its
    Contributor Version.

1.12. "Secondary License"
    means either the GNU General Public License, Version 2.0, the GNU
    Lesser General Public License, Version 2.1, the GNU Affero General
    Public License, Version 3.0, or any later versions of those
    licenses.

1.13. "Source Code Form"
    means the form of the work preferred for making modifications.

1.14. "You" (or "Your")
    means an individual or a legal entity exercising rights under this
    License. For legal entities, "You" includes any entity that
    controls, is controlled by, or is under common control with You. For
    purposes of this definition, "control" means (a) the power, direct
    or indirect, to cause the direction or management of such entity,
    whether by contract or otherwise, or (b) ownership of more than
    fifty percent (50%) of the outstanding shares or beneficial
    ownership of such entity.

2. License Grants and Conditions
--------------------------------

2.1. Grants

Each Contributor hereby grants You a world-wide, royalty-free,
non-exclusive license:

(a) under intellectual property rights (other than patent or trademark)
    Licensable by such Contributor to use, reproduce, make available,
    modify, display, perform, distribute, and otherwise exploit its
    Contributions, either on an unmodified basis, with Modifications, or
    as part of a Larger Work; and

(b) under Patent Claims of such Contributor to make, use, sell, offer
    for sale, have made, import, and otherwise transfer either its
    Contributions or its Contributor Version.

2.2. Effective Date

The licenses granted in Section 2.1 with respect to any Contribution
become effective for each Contribution on the date the Contributor first
distributes such Contribution.

2.3. Limitations on Grant Scope

The licenses granted in this Section 2 are the only rights granted under
this License. No additional rights or licenses will be implied from the
distribution or licensing of Covered Software under this License.
Notwithstanding Section 2.1(b) above, no patent license is granted by a
Contributor:

(a) for any code that a Contributor has removed from Covered Software;
    or

(b) for infringements caused by: (i) Your and any other third party's
    modifications of Covered Software, or (ii) the combination of its
    Contributions with other software (except as part of its Contributor
    Version); or

(c) under Patent Claims infringed by Covered Software in the absence of
    its Contributions.

This License does not grant any rights in the trademarks, service marks,
or logos of any Contributor (except as may be necessary to comply with
the notice requirements in Section 3.4).

2.4. Subsequent Licenses

No Contributor makes additional grants as a result of Your choice to
distribute the Covered Software under a subsequent version of this
License (see Section 10.2) or under the terms of a Secondary License (if
permitted under the terms of Section 3.3).

2.5. Representation

Each Contributor represents that the Contributor believes its
Contributions are its original creation(s) or it has sufficient rights
to grant the rights to its Contributions conveyed by this License.

2.6. Fair Use

This License is not intended to limit any rights You have under
applicable copyright doctrines of fair use, fair dealing, or other
equivalents.

2.7. Conditions

Sections 3.1, 3.2, 3.3, and 3.4 are conditions of the licenses granted
in Section 2.1.

3. Responsibilities
-------------------

3.1. Distribution of Source Form

All distribution of Covered Software in Source Code Form, including any
Modifications that You create or to which You contribute, must be under
the terms of this License. You must inform recipients that the Source
Code Form of the Covered Software is governed by the terms of this
License, and how they can obtain a copy of this License. You may not
attempt to alter or restrict the recipients' rights in the Source Code
Form.

3.2. Distribution of Executable Form

If You distribute Covered Software in Executable Form then:

(a) such Covered Software must also be made available in Source Code
    Form, as described in Section 3.1, and You must inform recipients of
    the Executable Form how they can obtain a copy of such Source Code
    Form by reasonable means in a timely manner, at a charge no more
    than the cost of distribution to the recipient; and

(b) You may distribute such Executable Form under the terms of this
    License, or sublicense it under different terms, provided that the
    license for the Executable Form does not attempt to limit or alter
    the recipients' rights in the Source Code Form under this License.

3.3. Distribution of a Larger Work

You may create and distribute a Larger Work under terms of Your choice,
provided that You also comply with the requirements of this License for
the Covered Software. If the Larger Work is a combination of Covered
Software with a work governed by one or more Secondary Licenses, and the
Covered Software is not Incompatible With Secondary Licenses, this
License permits You to additionally distribute such Covered Software
under the terms of such Secondary License(s), so that the recipient of
the Larger Work may, at their option, further distribute the Covered
Software under the terms of either this License or such Secondary
License(s).

3.4. Notices

You may not remove or alter the substance of any license notices
(including copyright notices, patent notices, disclaimers of warranty,
or limitations of liability) contained within the Source Code Form of
the Covered Software, except that You may alter any license notices to
the extent required to remedy known factual inaccuracies.

3.5. Application of Additional Terms

You may choose to offer, and to charge a fee for, warranty, support,
indemnity or liability obligations to one or more recipients of Covered
Software. However, You may do so only on Your own behalf, and not on
behalf of any Contributor. You must make it absolutely clear that any
such warranty, support, indemnity, or liability obligation is offered by
You alone, and You hereby agree to indemnify every Contributor for any
liability incurred by such Contributor as a result of warranty, support,
indemnity or liability terms You offer. You may include additional
disclaimers of warranty and limitations of liability specific to any
jurisdiction.

4. Inability to Comply Due to Statute or Regulation
---------------------------------------------------

If it is impossible for You to comply with any of the terms of this
License with respect to some or all of the Covered Software due to
statute, judicial order, or regulation then You must: (a) comply with
the terms of this License to the maximum extent possible; and (b)
describe the limitations and the code they affect. Such description must
be placed in a text file included with all distributions of the Covered
Software under this License. Except to the extent prohibited by statute
or regulation, such description must be sufficiently detailed for a
recipient of ordinary skill to be able to understand it.

5. Termination
--------------

5.1. The rights granted under this License will terminate automatically
if You fail to comply with any of its terms. However, if You become
compliant, then the rights granted under this License from a particular
Contributor are reinstated (a) provisionally, unless and until such
Contributor explicitly and finally terminates Your grants, and (b) on an
ongoing basis, if such Contributor fails to notify You of the
non-compliance by some reasonable means prior to 60 days after You have
come back into compliance. Moreover, Your grants from a particular
Contributor are reinstated on an ongoing basis if such Contributor
notifies You of the non-compliance by some reasonable means, this is the
first time You have received notice of non-compliance with this License
from such Contributor, and You become compliant prior to 30 days after
Your receipt of the notice.

5.2. If You initiate litigation against any entity by asserting a patent
infringement claim (excluding declaratory judgment actions,
counter-claims, and cross-claims) alleging that a Contributor Version
directly or indirectly infringes any patent, then the rights granted to
You by any and all Contributors for the Covered Software under Section
2.1 of this License shall terminate.

5.3. In the event of termination under Sections 5.1 or 5.2 above, all
end user license agreements (excluding distributors and resellers) which
have been validly granted by You or Your distributors under this License
prior to termination shall survive termination.

************************************************************************
*                                                                      *
*  6. Disclaimer of Warranty                                           *
*  -------------------------                                           *
*                                                                      *
*  Covered Software is provided under this License on an "as is"       *
*  basis, without warranty of any kind, either expressed, implied, or  *
*  statutory, including, without limitation, warranties that the       *
*  Covered Software is free of defects, merchantable, fit for a        *
*  particular purpose or non-infringing. The entire risk as to the     *
*  quality and performance of the Covered Software is with You.        *
*  Should any Covered Software prove defective in any respect, You     *
*  (not any Contributor) assume the cost of any necessary servicing,   *
*  repair, or correction. This disclaimer of warranty constitutes an   *
*  essential part of this License. No use of any Covered Software is   *
*  authorized under this License except under this disclaimer.         *
*                                                                      *
************************************************************************

************************************************************************
*                                                                      *
*  7. Limitation of Liability                                          *
*  --------------------------                                          *
*                                                                      *
*  Under no circumstances and under no legal theory, whether tort      *
*  (including negligence), contract, or otherwise, shall any           *
*  Contributor, or anyone who distributes Covered Software as          *
*  permitted above, be liable to You for any direct, indirect,         *
*  special, incidental, or consequential damages of any character      *
*  including, without limitation, damages for lost profits, loss of    *
*  goodwill, work stoppage, computer failure or malfunction, or any    *
*  and all other commercial damages or losses, even if such party      *
*  shall have been informed of the possibility of such damages. This   *
*  limitation of liability shall not apply to liability for death or   *
*  personal injury resulting from such party's negligence to the       *
*  extent applicable law prohibits such limitation. Some               *
*  jurisdictions do not allow the exclusion or limitation of           *
*  incidental or consequential damages, so this exclusion and          *
*  limitation may not apply to You.                                    *
*                                                                      *
************************************************************************

8. Litigation
-------------

Any litigation relating to this License may be brought only in the
courts of a jurisdiction where the defendant maintains its principal
place of business and such litigation shall be governed by laws of that
jurisdiction, without reference to its conflict-of-law provisions.
Nothing in this Section shall prevent a party's ability to bring
cross-claims or counter-claims.

9. Miscellaneous
----------------

This License represents the complete agreement concerning the subject
matter hereof. If any provision of this License is held to be
unenforceable, such provision shall be reformed only to the extent
necessary to make it enforceable. Any law or regulation which provides
that the language of a contract shall be construed against the drafter
shall not be used to construe this License against a Contributor.

10. Versions of the License
---------------------------

10.1. New Versions

Mozilla Foundation is the license steward. Except as provided in Section
10.3, no one other than the license steward has the right to modify or
publish new versions of this License. Each version will be given a
distinguishing version number.

10.2. Effect of New Versions

You may distribute the Covered Software under the terms of the version
of the License under which You originally received the Covered Software,
or under the terms of any subsequent version published by the license
steward.

10.3. Modified Versions

If you create software not governed by this License, and you want to
create a new license for such software, you may create and use a
modified version of this License if you rename the license and remove
any references to the name of the license steward (except to note that
such modified license differs from this License).

10.4. Distributing Source Code Form that is Incompatible With Secondary
Licenses

If You choose to distribute Source Code Form that is Incompatible With
Secondary Licenses under the terms of this version of the License, the
notice described in Exhibit B of this License must be attached.

Exhibit A - Source Code Form License Notice
-------------------------------------------

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.

If it is not possible or desirable to put the notice in a particular
file, then You may include the notice in a location (such as a LICENSE
file in a relevant directory) where a recipient would be likely to look
for such a notice.

You may add additional accurate notices of copyright ownership.

Exhibit B - "Incompatible With Secondary Licenses" Notice
---------------------------------------------------------

  This Source Code Form is "Incompatible With Secondary Licenses", as
  defined by the Mozilla Public License, v. 2.0.

```


<div style='page-break-after: always;'></div>

# File: .terraform\providers\registry.terraform.io\hashicorp\random\3.9.0\windows_amd64\LICENSE.txt

```txt
Copyright IBM Corp. 2017, 2026

Mozilla Public License Version 2.0
==================================

1. Definitions
--------------

1.1. "Contributor"
    means each individual or legal entity that creates, contributes to
    the creation of, or owns Covered Software.

1.2. "Contributor Version"
    means the combination of the Contributions of others (if any) used
    by a Contributor and that particular Contributor's Contribution.

1.3. "Contribution"
    means Covered Software of a particular Contributor.

1.4. "Covered Software"
    means Source Code Form to which the initial Contributor has attached
    the notice in Exhibit A, the Executable Form of such Source Code
    Form, and Modifications of such Source Code Form, in each case
    including portions thereof.

1.5. "Incompatible With Secondary Licenses"
    means

    (a) that the initial Contributor has attached the notice described
        in Exhibit B to the Covered Software; or

    (b) that the Covered Software was made available under the terms of
        version 1.1 or earlier of the License, but not also under the
        terms of a Secondary License.

1.6. "Executable Form"
    means any form of the work other than Source Code Form.

1.7. "Larger Work"
    means a work that combines Covered Software with other material, in
    a separate file or files, that is not Covered Software.

1.8. "License"
    means this document.

1.9. "Licensable"
    means having the right to grant, to the maximum extent possible,
    whether at the time of the initial grant or subsequently, any and
    all of the rights conveyed by this License.

1.10. "Modifications"
    means any of the following:

    (a) any file in Source Code Form that results from an addition to,
        deletion from, or modification of the contents of Covered
        Software; or

    (b) any new file in Source Code Form that contains any Covered
        Software.

1.11. "Patent Claims" of a Contributor
    means any patent claim(s), including without limitation, method,
    process, and apparatus claims, in any patent Licensable by such
    Contributor that would be infringed, but for the grant of the
    License, by the making, using, selling, offering for sale, having
    made, import, or transfer of either its Contributions or its
    Contributor Version.

1.12. "Secondary License"
    means either the GNU General Public License, Version 2.0, the GNU
    Lesser General Public License, Version 2.1, the GNU Affero General
    Public License, Version 3.0, or any later versions of those
    licenses.

1.13. "Source Code Form"
    means the form of the work preferred for making modifications.

1.14. "You" (or "Your")
    means an individual or a legal entity exercising rights under this
    License. For legal entities, "You" includes any entity that
    controls, is controlled by, or is under common control with You. For
    purposes of this definition, "control" means (a) the power, direct
    or indirect, to cause the direction or management of such entity,
    whether by contract or otherwise, or (b) ownership of more than
    fifty percent (50%) of the outstanding shares or beneficial
    ownership of such entity.

2. License Grants and Conditions
--------------------------------

2.1. Grants

Each Contributor hereby grants You a world-wide, royalty-free,
non-exclusive license:

(a) under intellectual property rights (other than patent or trademark)
    Licensable by such Contributor to use, reproduce, make available,
    modify, display, perform, distribute, and otherwise exploit its
    Contributions, either on an unmodified basis, with Modifications, or
    as part of a Larger Work; and

(b) under Patent Claims of such Contributor to make, use, sell, offer
    for sale, have made, import, and otherwise transfer either its
    Contributions or its Contributor Version.

2.2. Effective Date

The licenses granted in Section 2.1 with respect to any Contribution
become effective for each Contribution on the date the Contributor first
distributes such Contribution.

2.3. Limitations on Grant Scope

The licenses granted in this Section 2 are the only rights granted under
this License. No additional rights or licenses will be implied from the
distribution or licensing of Covered Software under this License.
Notwithstanding Section 2.1(b) above, no patent license is granted by a
Contributor:

(a) for any code that a Contributor has removed from Covered Software;
    or

(b) for infringements caused by: (i) Your and any other third party's
    modifications of Covered Software, or (ii) the combination of its
    Contributions with other software (except as part of its Contributor
    Version); or

(c) under Patent Claims infringed by Covered Software in the absence of
    its Contributions.

This License does not grant any rights in the trademarks, service marks,
or logos of any Contributor (except as may be necessary to comply with
the notice requirements in Section 3.4).

2.4. Subsequent Licenses

No Contributor makes additional grants as a result of Your choice to
distribute the Covered Software under a subsequent version of this
License (see Section 10.2) or under the terms of a Secondary License (if
permitted under the terms of Section 3.3).

2.5. Representation

Each Contributor represents that the Contributor believes its
Contributions are its original creation(s) or it has sufficient rights
to grant the rights to its Contributions conveyed by this License.

2.6. Fair Use

This License is not intended to limit any rights You have under
applicable copyright doctrines of fair use, fair dealing, or other
equivalents.

2.7. Conditions

Sections 3.1, 3.2, 3.3, and 3.4 are conditions of the licenses granted
in Section 2.1.

3. Responsibilities
-------------------

3.1. Distribution of Source Form

All distribution of Covered Software in Source Code Form, including any
Modifications that You create or to which You contribute, must be under
the terms of this License. You must inform recipients that the Source
Code Form of the Covered Software is governed by the terms of this
License, and how they can obtain a copy of this License. You may not
attempt to alter or restrict the recipients' rights in the Source Code
Form.

3.2. Distribution of Executable Form

If You distribute Covered Software in Executable Form then:

(a) such Covered Software must also be made available in Source Code
    Form, as described in Section 3.1, and You must inform recipients of
    the Executable Form how they can obtain a copy of such Source Code
    Form by reasonable means in a timely manner, at a charge no more
    than the cost of distribution to the recipient; and

(b) You may distribute such Executable Form under the terms of this
    License, or sublicense it under different terms, provided that the
    license for the Executable Form does not attempt to limit or alter
    the recipients' rights in the Source Code Form under this License.

3.3. Distribution of a Larger Work

You may create and distribute a Larger Work under terms of Your choice,
provided that You also comply with the requirements of this License for
the Covered Software. If the Larger Work is a combination of Covered
Software with a work governed by one or more Secondary Licenses, and the
Covered Software is not Incompatible With Secondary Licenses, this
License permits You to additionally distribute such Covered Software
under the terms of such Secondary License(s), so that the recipient of
the Larger Work may, at their option, further distribute the Covered
Software under the terms of either this License or such Secondary
License(s).

3.4. Notices

You may not remove or alter the substance of any license notices
(including copyright notices, patent notices, disclaimers of warranty,
or limitations of liability) contained within the Source Code Form of
the Covered Software, except that You may alter any license notices to
the extent required to remedy known factual inaccuracies.

3.5. Application of Additional Terms

You may choose to offer, and to charge a fee for, warranty, support,
indemnity or liability obligations to one or more recipients of Covered
Software. However, You may do so only on Your own behalf, and not on
behalf of any Contributor. You must make it absolutely clear that any
such warranty, support, indemnity, or liability obligation is offered by
You alone, and You hereby agree to indemnify every Contributor for any
liability incurred by such Contributor as a result of warranty, support,
indemnity or liability terms You offer. You may include additional
disclaimers of warranty and limitations of liability specific to any
jurisdiction.

4. Inability to Comply Due to Statute or Regulation
---------------------------------------------------

If it is impossible for You to comply with any of the terms of this
License with respect to some or all of the Covered Software due to
statute, judicial order, or regulation then You must: (a) comply with
the terms of this License to the maximum extent possible; and (b)
describe the limitations and the code they affect. Such description must
be placed in a text file included with all distributions of the Covered
Software under this License. Except to the extent prohibited by statute
or regulation, such description must be sufficiently detailed for a
recipient of ordinary skill to be able to understand it.

5. Termination
--------------

5.1. The rights granted under this License will terminate automatically
if You fail to comply with any of its terms. However, if You become
compliant, then the rights granted under this License from a particular
Contributor are reinstated (a) provisionally, unless and until such
Contributor explicitly and finally terminates Your grants, and (b) on an
ongoing basis, if such Contributor fails to notify You of the
non-compliance by some reasonable means prior to 60 days after You have
come back into compliance. Moreover, Your grants from a particular
Contributor are reinstated on an ongoing basis if such Contributor
notifies You of the non-compliance by some reasonable means, this is the
first time You have received notice of non-compliance with this License
from such Contributor, and You become compliant prior to 30 days after
Your receipt of the notice.

5.2. If You initiate litigation against any entity by asserting a patent
infringement claim (excluding declaratory judgment actions,
counter-claims, and cross-claims) alleging that a Contributor Version
directly or indirectly infringes any patent, then the rights granted to
You by any and all Contributors for the Covered Software under Section
2.1 of this License shall terminate.

5.3. In the event of termination under Sections 5.1 or 5.2 above, all
end user license agreements (excluding distributors and resellers) which
have been validly granted by You or Your distributors under this License
prior to termination shall survive termination.

************************************************************************
*                                                                      *
*  6. Disclaimer of Warranty                                           *
*  -------------------------                                           *
*                                                                      *
*  Covered Software is provided under this License on an "as is"       *
*  basis, without warranty of any kind, either expressed, implied, or  *
*  statutory, including, without limitation, warranties that the       *
*  Covered Software is free of defects, merchantable, fit for a        *
*  particular purpose or non-infringing. The entire risk as to the     *
*  quality and performance of the Covered Software is with You.        *
*  Should any Covered Software prove defective in any respect, You     *
*  (not any Contributor) assume the cost of any necessary servicing,   *
*  repair, or correction. This disclaimer of warranty constitutes an   *
*  essential part of this License. No use of any Covered Software is   *
*  authorized under this License except under this disclaimer.         *
*                                                                      *
************************************************************************

************************************************************************
*                                                                      *
*  7. Limitation of Liability                                          *
*  --------------------------                                          *
*                                                                      *
*  Under no circumstances and under no legal theory, whether tort      *
*  (including negligence), contract, or otherwise, shall any           *
*  Contributor, or anyone who distributes Covered Software as          *
*  permitted above, be liable to You for any direct, indirect,         *
*  special, incidental, or consequential damages of any character      *
*  including, without limitation, damages for lost profits, loss of    *
*  goodwill, work stoppage, computer failure or malfunction, or any    *
*  and all other commercial damages or losses, even if such party      *
*  shall have been informed of the possibility of such damages. This   *
*  limitation of liability shall not apply to liability for death or   *
*  personal injury resulting from such party's negligence to the       *
*  extent applicable law prohibits such limitation. Some               *
*  jurisdictions do not allow the exclusion or limitation of           *
*  incidental or consequential damages, so this exclusion and          *
*  limitation may not apply to You.                                    *
*                                                                      *
************************************************************************

8. Litigation
-------------

Any litigation relating to this License may be brought only in the
courts of a jurisdiction where the defendant maintains its principal
place of business and such litigation shall be governed by laws of that
jurisdiction, without reference to its conflict-of-law provisions.
Nothing in this Section shall prevent a party's ability to bring
cross-claims or counter-claims.

9. Miscellaneous
----------------

This License represents the complete agreement concerning the subject
matter hereof. If any provision of this License is held to be
unenforceable, such provision shall be reformed only to the extent
necessary to make it enforceable. Any law or regulation which provides
that the language of a contract shall be construed against the drafter
shall not be used to construe this License against a Contributor.

10. Versions of the License
---------------------------

10.1. New Versions

Mozilla Foundation is the license steward. Except as provided in Section
10.3, no one other than the license steward has the right to modify or
publish new versions of this License. Each version will be given a
distinguishing version number.

10.2. Effect of New Versions

You may distribute the Covered Software under the terms of the version
of the License under which You originally received the Covered Software,
or under the terms of any subsequent version published by the license
steward.

10.3. Modified Versions

If you create software not governed by this License, and you want to
create a new license for such software, you may create and use a
modified version of this License if you rename the license and remove
any references to the name of the license steward (except to note that
such modified license differs from this License).

10.4. Distributing Source Code Form that is Incompatible With Secondary
Licenses

If You choose to distribute Source Code Form that is Incompatible With
Secondary Licenses under the terms of this version of the License, the
notice described in Exhibit B of this License must be attached.

Exhibit A - Source Code Form License Notice
-------------------------------------------

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.

If it is not possible or desirable to put the notice in a particular
file, then You may include the notice in a location (such as a LICENSE
file in a relevant directory) where a recipient would be likely to look
for such a notice.

You may add additional accurate notices of copyright ownership.

Exhibit B - "Incompatible With Secondary Licenses" Notice
---------------------------------------------------------

  This Source Code Form is "Incompatible With Secondary Licenses", as
  defined by the Mozilla Public License, v. 2.0.

```


<div style='page-break-after: always;'></div>

# File: .terraform\providers\registry.terraform.io\hashicorp\tls\4.3.0\windows_amd64\LICENSE.txt

```txt
Copyright IBM Corp. 2017, 2026

Mozilla Public License Version 2.0
==================================

1. Definitions
--------------

1.1. "Contributor"
    means each individual or legal entity that creates, contributes to
    the creation of, or owns Covered Software.

1.2. "Contributor Version"
    means the combination of the Contributions of others (if any) used
    by a Contributor and that particular Contributor's Contribution.

1.3. "Contribution"
    means Covered Software of a particular Contributor.

1.4. "Covered Software"
    means Source Code Form to which the initial Contributor has attached
    the notice in Exhibit A, the Executable Form of such Source Code
    Form, and Modifications of such Source Code Form, in each case
    including portions thereof.

1.5. "Incompatible With Secondary Licenses"
    means

    (a) that the initial Contributor has attached the notice described
        in Exhibit B to the Covered Software; or

    (b) that the Covered Software was made available under the terms of
        version 1.1 or earlier of the License, but not also under the
        terms of a Secondary License.

1.6. "Executable Form"
    means any form of the work other than Source Code Form.

1.7. "Larger Work"
    means a work that combines Covered Software with other material, in
    a separate file or files, that is not Covered Software.

1.8. "License"
    means this document.

1.9. "Licensable"
    means having the right to grant, to the maximum extent possible,
    whether at the time of the initial grant or subsequently, any and
    all of the rights conveyed by this License.

1.10. "Modifications"
    means any of the following:

    (a) any file in Source Code Form that results from an addition to,
        deletion from, or modification of the contents of Covered
        Software; or

    (b) any new file in Source Code Form that contains any Covered
        Software.

1.11. "Patent Claims" of a Contributor
    means any patent claim(s), including without limitation, method,
    process, and apparatus claims, in any patent Licensable by such
    Contributor that would be infringed, but for the grant of the
    License, by the making, using, selling, offering for sale, having
    made, import, or transfer of either its Contributions or its
    Contributor Version.

1.12. "Secondary License"
    means either the GNU General Public License, Version 2.0, the GNU
    Lesser General Public License, Version 2.1, the GNU Affero General
    Public License, Version 3.0, or any later versions of those
    licenses.

1.13. "Source Code Form"
    means the form of the work preferred for making modifications.

1.14. "You" (or "Your")
    means an individual or a legal entity exercising rights under this
    License. For legal entities, "You" includes any entity that
    controls, is controlled by, or is under common control with You. For
    purposes of this definition, "control" means (a) the power, direct
    or indirect, to cause the direction or management of such entity,
    whether by contract or otherwise, or (b) ownership of more than
    fifty percent (50%) of the outstanding shares or beneficial
    ownership of such entity.

2. License Grants and Conditions
--------------------------------

2.1. Grants

Each Contributor hereby grants You a world-wide, royalty-free,
non-exclusive license:

(a) under intellectual property rights (other than patent or trademark)
    Licensable by such Contributor to use, reproduce, make available,
    modify, display, perform, distribute, and otherwise exploit its
    Contributions, either on an unmodified basis, with Modifications, or
    as part of a Larger Work; and

(b) under Patent Claims of such Contributor to make, use, sell, offer
    for sale, have made, import, and otherwise transfer either its
    Contributions or its Contributor Version.

2.2. Effective Date

The licenses granted in Section 2.1 with respect to any Contribution
become effective for each Contribution on the date the Contributor first
distributes such Contribution.

2.3. Limitations on Grant Scope

The licenses granted in this Section 2 are the only rights granted under
this License. No additional rights or licenses will be implied from the
distribution or licensing of Covered Software under this License.
Notwithstanding Section 2.1(b) above, no patent license is granted by a
Contributor:

(a) for any code that a Contributor has removed from Covered Software;
    or

(b) for infringements caused by: (i) Your and any other third party's
    modifications of Covered Software, or (ii) the combination of its
    Contributions with other software (except as part of its Contributor
    Version); or

(c) under Patent Claims infringed by Covered Software in the absence of
    its Contributions.

This License does not grant any rights in the trademarks, service marks,
or logos of any Contributor (except as may be necessary to comply with
the notice requirements in Section 3.4).

2.4. Subsequent Licenses

No Contributor makes additional grants as a result of Your choice to
distribute the Covered Software under a subsequent version of this
License (see Section 10.2) or under the terms of a Secondary License (if
permitted under the terms of Section 3.3).

2.5. Representation

Each Contributor represents that the Contributor believes its
Contributions are its original creation(s) or it has sufficient rights
to grant the rights to its Contributions conveyed by this License.

2.6. Fair Use

This License is not intended to limit any rights You have under
applicable copyright doctrines of fair use, fair dealing, or other
equivalents.

2.7. Conditions

Sections 3.1, 3.2, 3.3, and 3.4 are conditions of the licenses granted
in Section 2.1.

3. Responsibilities
-------------------

3.1. Distribution of Source Form

All distribution of Covered Software in Source Code Form, including any
Modifications that You create or to which You contribute, must be under
the terms of this License. You must inform recipients that the Source
Code Form of the Covered Software is governed by the terms of this
License, and how they can obtain a copy of this License. You may not
attempt to alter or restrict the recipients' rights in the Source Code
Form.

3.2. Distribution of Executable Form

If You distribute Covered Software in Executable Form then:

(a) such Covered Software must also be made available in Source Code
    Form, as described in Section 3.1, and You must inform recipients of
    the Executable Form how they can obtain a copy of such Source Code
    Form by reasonable means in a timely manner, at a charge no more
    than the cost of distribution to the recipient; and

(b) You may distribute such Executable Form under the terms of this
    License, or sublicense it under different terms, provided that the
    license for the Executable Form does not attempt to limit or alter
    the recipients' rights in the Source Code Form under this License.

3.3. Distribution of a Larger Work

You may create and distribute a Larger Work under terms of Your choice,
provided that You also comply with the requirements of this License for
the Covered Software. If the Larger Work is a combination of Covered
Software with a work governed by one or more Secondary Licenses, and the
Covered Software is not Incompatible With Secondary Licenses, this
License permits You to additionally distribute such Covered Software
under the terms of such Secondary License(s), so that the recipient of
the Larger Work may, at their option, further distribute the Covered
Software under the terms of either this License or such Secondary
License(s).

3.4. Notices

You may not remove or alter the substance of any license notices
(including copyright notices, patent notices, disclaimers of warranty,
or limitations of liability) contained within the Source Code Form of
the Covered Software, except that You may alter any license notices to
the extent required to remedy known factual inaccuracies.

3.5. Application of Additional Terms

You may choose to offer, and to charge a fee for, warranty, support,
indemnity or liability obligations to one or more recipients of Covered
Software. However, You may do so only on Your own behalf, and not on
behalf of any Contributor. You must make it absolutely clear that any
such warranty, support, indemnity, or liability obligation is offered by
You alone, and You hereby agree to indemnify every Contributor for any
liability incurred by such Contributor as a result of warranty, support,
indemnity or liability terms You offer. You may include additional
disclaimers of warranty and limitations of liability specific to any
jurisdiction.

4. Inability to Comply Due to Statute or Regulation
---------------------------------------------------

If it is impossible for You to comply with any of the terms of this
License with respect to some or all of the Covered Software due to
statute, judicial order, or regulation then You must: (a) comply with
the terms of this License to the maximum extent possible; and (b)
describe the limitations and the code they affect. Such description must
be placed in a text file included with all distributions of the Covered
Software under this License. Except to the extent prohibited by statute
or regulation, such description must be sufficiently detailed for a
recipient of ordinary skill to be able to understand it.

5. Termination
--------------

5.1. The rights granted under this License will terminate automatically
if You fail to comply with any of its terms. However, if You become
compliant, then the rights granted under this License from a particular
Contributor are reinstated (a) provisionally, unless and until such
Contributor explicitly and finally terminates Your grants, and (b) on an
ongoing basis, if such Contributor fails to notify You of the
non-compliance by some reasonable means prior to 60 days after You have
come back into compliance. Moreover, Your grants from a particular
Contributor are reinstated on an ongoing basis if such Contributor
notifies You of the non-compliance by some reasonable means, this is the
first time You have received notice of non-compliance with this License
from such Contributor, and You become compliant prior to 30 days after
Your receipt of the notice.

5.2. If You initiate litigation against any entity by asserting a patent
infringement claim (excluding declaratory judgment actions,
counter-claims, and cross-claims) alleging that a Contributor Version
directly or indirectly infringes any patent, then the rights granted to
You by any and all Contributors for the Covered Software under Section
2.1 of this License shall terminate.

5.3. In the event of termination under Sections 5.1 or 5.2 above, all
end user license agreements (excluding distributors and resellers) which
have been validly granted by You or Your distributors under this License
prior to termination shall survive termination.

************************************************************************
*                                                                      *
*  6. Disclaimer of Warranty                                           *
*  -------------------------                                           *
*                                                                      *
*  Covered Software is provided under this License on an "as is"       *
*  basis, without warranty of any kind, either expressed, implied, or  *
*  statutory, including, without limitation, warranties that the       *
*  Covered Software is free of defects, merchantable, fit for a        *
*  particular purpose or non-infringing. The entire risk as to the     *
*  quality and performance of the Covered Software is with You.        *
*  Should any Covered Software prove defective in any respect, You     *
*  (not any Contributor) assume the cost of any necessary servicing,   *
*  repair, or correction. This disclaimer of warranty constitutes an   *
*  essential part of this License. No use of any Covered Software is   *
*  authorized under this License except under this disclaimer.         *
*                                                                      *
************************************************************************

************************************************************************
*                                                                      *
*  7. Limitation of Liability                                          *
*  --------------------------                                          *
*                                                                      *
*  Under no circumstances and under no legal theory, whether tort      *
*  (including negligence), contract, or otherwise, shall any           *
*  Contributor, or anyone who distributes Covered Software as          *
*  permitted above, be liable to You for any direct, indirect,         *
*  special, incidental, or consequential damages of any character      *
*  including, without limitation, damages for lost profits, loss of    *
*  goodwill, work stoppage, computer failure or malfunction, or any    *
*  and all other commercial damages or losses, even if such party      *
*  shall have been informed of the possibility of such damages. This   *
*  limitation of liability shall not apply to liability for death or   *
*  personal injury resulting from such party's negligence to the       *
*  extent applicable law prohibits such limitation. Some               *
*  jurisdictions do not allow the exclusion or limitation of           *
*  incidental or consequential damages, so this exclusion and          *
*  limitation may not apply to You.                                    *
*                                                                      *
************************************************************************

8. Litigation
-------------

Any litigation relating to this License may be brought only in the
courts of a jurisdiction where the defendant maintains its principal
place of business and such litigation shall be governed by laws of that
jurisdiction, without reference to its conflict-of-law provisions.
Nothing in this Section shall prevent a party's ability to bring
cross-claims or counter-claims.

9. Miscellaneous
----------------

This License represents the complete agreement concerning the subject
matter hereof. If any provision of this License is held to be
unenforceable, such provision shall be reformed only to the extent
necessary to make it enforceable. Any law or regulation which provides
that the language of a contract shall be construed against the drafter
shall not be used to construe this License against a Contributor.

10. Versions of the License
---------------------------

10.1. New Versions

Mozilla Foundation is the license steward. Except as provided in Section
10.3, no one other than the license steward has the right to modify or
publish new versions of this License. Each version will be given a
distinguishing version number.

10.2. Effect of New Versions

You may distribute the Covered Software under the terms of the version
of the License under which You originally received the Covered Software,
or under the terms of any subsequent version published by the license
steward.

10.3. Modified Versions

If you create software not governed by this License, and you want to
create a new license for such software, you may create and use a
modified version of this License if you rename the license and remove
any references to the name of the license steward (except to note that
such modified license differs from this License).

10.4. Distributing Source Code Form that is Incompatible With Secondary
Licenses

If You choose to distribute Source Code Form that is Incompatible With
Secondary Licenses under the terms of this version of the License, the
notice described in Exhibit B of this License must be attached.

Exhibit A - Source Code Form License Notice
-------------------------------------------

  This Source Code Form is subject to the terms of the Mozilla Public
  License, v. 2.0. If a copy of the MPL was not distributed with this
  file, You can obtain one at http://mozilla.org/MPL/2.0/.

If it is not possible or desirable to put the notice in a particular
file, then You may include the notice in a location (such as a LICENSE
file in a relevant directory) where a recipient would be likely to look
for such a notice.

You may add additional accurate notices of copyright ownership.

Exhibit B - "Incompatible With Secondary Licenses" Notice
---------------------------------------------------------

  This Source Code Form is "Incompatible With Secondary Licenses", as
  defined by the Mozilla Public License, v. 2.0.

```


<div style='page-break-after: always;'></div>

# File: code base.docx

```docx
PK     ! ߤ�lZ      [Content_Types].xml �(�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ���n�0E�����Ub袪*�>�-R�{V��Ǽ��QU�
l"%3��3Vƃ�ښl	�w%�=���^i7+���-d&�0�A�6�l4��L60#�Ò�S
O����X� �*��V$z�3��3������%p)O�^����5}nH"d�s�Xg�L�`���|�ԟ�|�P�rۃs�?�PW��tt4Q+��"�wa���|T\y���,N���U�%���-D/��ܚ��X�ݞ�(���<E��)�� ;�N�L?�F�˼��܉��<Fk�	�h�y����ڜ���q�i��?�ޯl��i� 1��]�H�g��m�@����m�  �� PK     ! ���   N   _rels/.rels �(�                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ���j�0@���ѽQ���N/c���[IL��j���<��]�aG��ӓ�zs�Fu�]��U��	��^�[��x ����1x�p����f��#I)ʃ�Y���������*D��i")��c$���qU���~3��1��jH[{�=E����~
f?��3-���޲]�Tꓸ2�j)�,l0/%��b�
���z���ŉ�,	�	�/�|f\Z���?6�!Y�_�o�]A�  �� PK     ! �d�Q�   1   word/_rels/document.xml.rels �(�                                                                                                                                                                                                                                                                 ���j�0E�����}-;}PB�lJ!��� E?�,	��`HI��`��r��sπ6����w��{���r茯{�*x���AkWk�*�`[^^l��jNK���D�8R�1���d:4e>�K/����4�Vm^u�r��w2NP�0ŮVw�5�j��o���7o:>S!?p����8JX[d�0KD��EVK���c2�P,���ũ�a���]���.���ﰘs�Yҡ�+�����(!O>z�  �� PK     ! ��Z�<  *�    word/document.xml��rǙ��?U�f�Tjs� /6SYɡ(�VU�$%[[�k�1�F�[zf@�[�ϒgɓ� � .Cbz��*�-d����������$��RQ�>{r����4��(>{�w�}��+J��"�R��ɵ,�|�������zfA�ȴ��G��ӫ<x�dT��ӽ�"�D�$
TVde?Ȓ���"
��U�½�������UȢ���L�cQ<�}\�q�O���_\�{�H�R~�������w�?(���,���͋L%�����{�P�U�ӟ��2DqT^��?����ٓJ�Og����_�t����q�j��;���3qL�㞒����E��=M��4����߷�q�������f
�r*���Ώ?eO��?�`����+�����O��(����ښ/6��h�8��ǅ��#�f�W\'���U>l&�TV�?-j�i���O�U�j�Ϛi˗\4�aގD��r<}=L3%�����=->o"�>%O�k����g�]=�4�<{���������'7�饼U\ֿ�r�����+��o��[�S>?{�>��,/��8�L�Q*��}��X�e��>c��R^��,r��z�R��T���*%gr�U�"�|y/��^)��	x_+y����������&���Y��\��=3�dnO���w�o	 ?W�?�Q���X�Ϟ����Ag��EUf��^D��݃W��ӟ��E�uH�����?��sqTk��wG7�򦪕J���(�_���U�)Kˢ��"��:ӂ����^=���i�gO�E�,����&KDZ���Tk�����r�&˸Y��o�g?��7��p��ůg�O������Yk�����d�T���u�6T"y[jc<[�R]�ܢ������%��*m܄�e���5��'Ͻ�ޘ!՝U��_��V��"�ql/���G)��q��p�T�n눁�>{ur���S�'��x����O���TF �I�d�fR/|��Vb(q�a����W��%�Ն�"a�� �������`EV�@�}x��>�E�[;b��+6�햭$�Qd*�̂[�{�k�������kio��Y:r1d���ߺt�Q7�;F����֙�u�敹�)��]�$�A����"���T�v��5��'��l��n
�L2&��L.��\�7�cp�w�r��:Z��Vy#�ws�1����`�F�i�H/'խ1p�$�I7�׻�7�ଦ ���XK{C��
��ts���"�
@����ּ2�]�8D�CFB7�
)r��IukG\39|r��vao⥐:�"c�Ͱ�dr������18�%r��u�h*���R��7��� ǂ�|�PȭH���׋��W�'C��߆��)'�4uX��ֵ��rH�w��{�h��(�X�����z
�y��ۺ����y8=?~)���I �̤��A�:|�U@�� �����ٿ}�XUǪ�tw6q�8��6�t�,Md:w�9��8��{Ñ�Hw�FW*ϊ�F�*m�4j�
{2j��W*�Z�i&�x�s<7�/E)��w+��(�u7t���Q��r�4�fc�|�噬O&H���/]i��\3�<�@����n�Z�ʡr�S9�m�72����J���WqA�pMD �a���OON����F_5�|����V�N�z�!z�\(�*��-����Z�Cm���d�`֚��h�/�"�� �����5Ko�u�6����t��d��qZZ�F�����������-�=`?.p(-�o��W�� �E��ɄW��d�8֝�p%��,��M�>����ߐ���"�jC�Y�dE�+l8I�Hu!�ut|r��x;闪��s�a8l&��ﳫT*��-������|7�=L��C��`lL66���=���1��=�O�:�@'����~�E���-Q����`� ��\����bc��١�.�D�����z�;���%]����<��1n�t�C 0���mϓ%J�Dhl,��P���G��D�:y��W���%T��PyL��ф�*�w�����G�d�0Y�R��q��4�.��Ĵ�*�@`@;A�:�5�i��	:��9�HL���*E��J�������H;���c;��y`}#1���X��7��� �Ջ�mA��m���"��wO���h�ڊ@�Çc�Ը�l$S)�c���Bf�J�R����/��Z���xs�4d,T�%ZC�\D+[�T�ߊ$����՗���s�1�t���{h�!6F �����`,���{}j�~���1��u�©-q̡vDϿ�`�����c�sp{K�}nK�w	w[	w�x'E�*B*�7aT�:zX��[�86�U��������b�22�߾y�98�8:{u�e�k�����㜣�<��@N�������v�O�8�[�a*a��F���C�LV9Z0�䩮����n��(����OҔ�U�F���,o��f�VR7�D��(o�,;�}��D�Ij����!�~c���朔~1�|\�*�*!V%V��b$��X9[�8�=����n�'�v�SB�͚[�T||�������/�$J��t�.�����|3V+�z��M�F��T2<C�B������Lխ�u�0TY��'t*�wz�PUT�qc��6�D��Z�@� qq�#�_�C}6�"42_�	�04v��w����@h1 "���EFeFD���δ�(D�J�unh��xO����l�n�z����A  O���h����ޥ�����|�m�R[�q�p쪨�EV�`� �G���&�m(96Y~�����v��i�N�9�6o^�Hox��e@h޺�1���"Ȫ�\g���Ԅ�;O��(�v�����&�ˁ��o�:��?p��J^��'7��|� �a��r�`W����ݗ7oO�V@�	a�#uU�(����wmп����V�����1V��C�r;��� �,.�|{|כ��q��ڿs���	�M�m����Ӱ���a�Ⱥu-�a��E��k�	�z.4,ҰX��f���$��qz�����;�bq��"�7-����㓳���-�7�	�n��&��ۅ��շ�|j}� �������Ϸ�X'➶�����nL�jGiR�鋴�ˉ[���> }��M�`�͟&�.�j�l�U�k�,��g���:�O ��Ɯ������b_m���:�_?�DR��v��*U�Nˏ*U�ܞ�f�:**���P��7��� F_,��_��f��o���]<_3����ܒ�ds�?��(F<����E�ݺ2�!t�.s���JO�����`�b�Y$�*�y�@܀��C��]g�{�p�$9�E�d�ˣI�I��(o�b�c}�h����3�$�.oӧ��5��[ߧ�8����\�|��*�p��I)3L-���l����z��vZJJ���(o9���Lw�2�</-]��>eC7??�L?��3[W�aUITQ��l~�mB4pՍ����}�fh�K�p��h}C  `���OON����W��h�.�����:���L��)��4�J��b(_().'_;q��.������*���,���/�
�k�308�]i"���&8VDlmh!%� 
�?����u�E״c,T_{]~�%��8'q�@���W��A,�0-����Lu������E��.���RU�9;��!r�DeEYOgY��"�@�;2�B�i!y[����tj�N�-l���&f6uZ~�lbf�툲��yM��]XT�h�+���X��7��� �Ջ�3�ꈶzo�A*��=z��AI�uKmE ��k�Kw�k�f��k�ͮ5�n���f3'�+"ͫA�mƻ"8kC��o�Fa������w.�=�f�V��`���݃d���@��)�ь�B���,�d���]8�b,�X�8*��_���S?"�}(Jѯ��9�Y�)vW�CS�g˾�w��<^׹�
O�-]�/s��m�m�mk�&"�gW��Y�ǢJ��Le�L6��#i��d��E�tj�NΌ�:�ii�'����ۥ�3*�c�C߈H�& �
��]�
�Yk�
WpX8��i���(%wpp�����B�����$�d�'Y���h���������y��\�� �\��Ν=������IH.��ᶵ�����f�%���1�+i����p�tj�N��G���l�r�۱ʡo���� �!-��m�^�Zv�;�~О���FQ@p���mY(�+.=/�.=��f.=7���<;���[�%\�wE���9�>�e����4#r�yi�7�	�ȶ��ЧG��:���.�陿�&7E~3ϓn�)M�;�gR�u����>�Z_?Ƞ��+����:�D�sQ�����p&���&{p�H\^\�[T�htƣr;V9��h}C  `��h�D[�V��U)�w�p��4=ʇ�J�uKmE �ხ���@W�Yk�+�YW���:�����v��x�wWD:��IK<.ZZHK<-���#�č�D���nY�[�d�pp^���ɽ�)��Q��~���>��  � ��p�˳����a-�Tz��z!��^��� A@'��,Gl�4��~Yu��=w��nE\�ʵ�r�y�	 �!�t�!c֚�!�`7d|QY�2�ҵv��2�����2���[�i!�+E5��2h]Y��i��_����Lw�?E6�+�~�%) ����m�`��7�v[��m9o2ދ�L(���Ί4W�X��47>Ai�6\K�B1� �<�@0 \��z�:���N]����܏�/��8�ۅEՊ��8Tn�*����@ � �n���@��Yk�[��qtp���v�9��E�Ն�9���Z|An�lZ	  3!N���[pC��0����-}C  `���OON����W��h�.��{+�JE�������I����h�ڊ@�0h3�ߦ|#�P*���|����|�˓)�v��5�{Ь����|��v���Z8�]�@�HQ��r�F�ֆ:�4	���^�I���p~��]F.�������v��ͼ���D�c���.���>�Z_?Ƞ�7P���J�u"��^1�-N1Nq�&%�E��|�[..�a���ON�8��޾�����ڻPY�0�Ҩ(�(�wy}��t8ͤ�.�Ə��`�b���@0$8���#Z��f0t�"x2O�$HI8���������Ij�$p��-�C�g��3�>J*�|n��wx�!1$6��e��K	�bP܆^�b�2z�e�?m�]p�Į���w[ݿ�ƫ!��.,��输D��q\�,p:9��g��c,T?����۫&���
{�C}�+�U���v|�U���đ��^<��刚^<z�n���U?��@�^V���JC�T��"
Hy� �~<���m�Ā b���nǃĐ��� ���n���	P�Sl���kȂ�,�݈�����{�v����
��S}���t�C 0��s��ew�_�!U<MZ���!1�O"��7���G�� �sB��7�Q�	 �/{/	��w�yٛ��I8����7.1VZ�|��W��{�W�MX�z�����>�9�z[����s��`Nٱ\9\���w�w��Oi�Z��D�7ID�kp�\�w����a�w���@0$����#��L�̥�	�'&n����r�����x�Xw	��e���]}L�Ā�3W�����8����]��5r���8��8`��r���C�ucM�'.+�I1Y;�7f��r�㶮2�&e0)t�N��n&�&ǎ� ��^��7Q�	 J�tJj֚J��CI}�9�֮0��c�1���u���2�'���! r�9	V���i��6���R��\�%���(-�R��uv��	�~Y�����9���ݭ�E&0�`3P[��ɀŹيL/��]�5����A`7I�|�-Z����u0�`�|l��m�*lf��{����j]tV�����;*'�2v����<�Q�ݰǓ!,�������2�<��	<d+A6��Y��+9�g�l���tF� �u|zrrt� �j��@[w��ޫ�C�uZ�"����탕h�ڊ@�������Z3w���.�f.�Z[�Uf�vWD:�TqK���-ܢ8��)�h3��GzOk�����(E�vo��E"~�R_S����~C�@v���&�����=�%�ҮiM��֚�a=�o�S����CmC�vֱ6ټ~^�(�}i �G$��$���|{��|�X�kp�u���ȂH�ҟ:~��"���m�=�[�bએ�O�^o����#l���r\���~*2����Ϙ�Y �~Q��mT��{�� ���D��n-���j�!Z� ���V�תd�Y�2$t��
���2��A,CƑ�i0m���R�N�i8��?�Hj@�u^��ޖ\g鏲܏�$»�fU������wH�_F��r��9���� ΂K?��ȂY�Q�U��&�j��U���}֧���7d�@3h6�E�+h�͍^��`�X�{J�Lu��r�� �au��\F����9��,������$JE�����Z8Pʔ�Q�S9�q�Vy v�˥�l$w/R~F:�6�$iis��;�����E��ks���O�va��3fJ@)@5}�R�u�b�P��J\�m�-0��C&��r�T9B[B[�	 +�(޲_�����[��e�����lw|�Wr��*�����Ѧo��u-�"%�X�!�h36�,n:��~p�_��z��"�f��)R}����1X �K]�ߦ|#�P*���|����|e�%h���z�1���]c��[kV +�7ٲS[T��g�S�W��ϼɻ����R=x�0����_ȠRQy�UV�o<V�pϼ�'8�۳��h��0�`Z�LE���2���Q�G�/�P�`[�kS\u�&".�`�s�`��zG(|O�\���+N�"����F��a�G `p��N�u�x�6�W�ߺUs+���޷�{_�<��S��F"���	c�/��Pb(�1�����,��R'��2�T�jT��/�0Ϣ��T[����F��Tb2�L�ic0]f�wr]H��i%�QE
Pj@m�������;K��~%�u7��M��e��C���7-W9���w��rKg���qd��Ǉw�(ˀ*�Hh5��*a�z�>��|��2|�4��"�4[��&	���2X���+,�@]�\9O���ݠ2� 3��de,��e1��I���)ϙc@(?.z(���r�㘭�@��K1\�H�^���
8t2%l�I$�����fs�)qr��P9�U}#E �������v ���_�mݥ�z�O��AV��w.��*S�w��Qp�.���m��P W�%ĕ,�J���^R�֎��&��I��@wN����F"��������w��e�c�yxH��w_�E���tR��6��Z�B�;/&f/se��s�
���OCi�����y��b��)�t�Y��a5�aE DfF�?0�QR%���X��r��x��g�G�~�����m8�F��qv%U 
Y���D�՜���ϰ6?�Y��7lN�d �7xID�h���D� ��s�g�g��a�al.��A�c�g�A�A�q�]��ޏ�/��wN�h(�ث�\5h͠��h�ԭ��泯�f,Sf!��G�޴qH�l�ͭ�9?wӉ!;��ڰ��'����]���F� �Ř+��m�ߦ|#�P*�k�����r�U7�PY��
QJ����[j+1L
\�L#0k�L
l>)pX�tk�s9�]��(-���E|ֆ�Q��ۭLE�K����F�ߝ.�; ?.l(3�o�$W�� �E�k��Ir���\T�Cm��"υ�E�Պ��"ϵ�M��,�+���,Ϊ�Ս��c�p���?��!�i��!r���\'�΅'�yk/�ur��"RQ�Q���T�X�X�h!�NR��dK�B������D����@ ��Eq�muD[?O�γ8
��Ӳ�(�z(#�:�V</�\&�#%ƅw����/�����v��#ǝ�ލ�>���O��e�|��~�+G}ãN��u-t��Vs�{a����\��Ԃ��T���2_���6�U�y��)ƭA�o����{/M6੶�O�u���wοi�EO]?$ZE�V����6�9��A�7I�S;rN\�&~�¢jE���h}C �@�z (�.8=F�U}�{3��v�?���G�J*��b���Nފ�A�&=�,m�+��6�}K� h�����6� ��q^'���-#-�@���I��h}C �@�Z ��.8-�E�U}�{3���Qz%E�gi����|�cN�x�ZH���?@0���0����?��p����@��j-�l\ox}��7R�M�k h� z٩�N����@h�h4@P](p ������f"u�"�t(��*�sQW�
9�AL�t�p����B� h�����]��q�h���6�;g�6� Vk�e�@�_�g��ӹ-�'Z!�`���Z�h�0Z����Vj�N+�QsU���L���*��L��p����@�ݺ��@��&�7��� ����@��ɮ%��?���[D��Oi`���G�B��>:}F���]@��@!t���{�*j��sܛ��پ&@p�� 
ߡ�oS��i(���P�PR\N��ވ�P�7���FoDw	Fo�=�7��z#�}z#�X�%�m�!q���#�!�yTW�	��� �Ջ:>=99:� _5�|����VO��^�3�wҢyh�D[��Vb>�D]�t���fZӚw�VZ�km�h����E-�xWgmh!}8��F�7�;��qM7�,q�����^:<'}�@0��w���8'a�i-��.W�Rn���A��j%�>�pd P�Z����Z3%��)A�&�$2HU����p�IqةIQ���"�ZC�IQ�"q�L7�I��@ ��5�vgq�i�trx�����<G�]v����6lS��n~ah~~�	Gq�x_i��q�P�߫V&�����%�4��& ��f�.�Oc֚�y�~�8F���@3p#�z��w_�4�L��E�Ղ�LC3y�e�A3���}\K3��/�-�E�m6_�m6���f�GC����x���tX�9�߽��c�M2��P*Cec�\�I���U�d���{x:w��G�'g/��ӄR�jt��0�q�C'����@ ��E��ꄶ.���N����
���z6�M����/S=<��x{�YV���X�T����a��Ң�[j+1\9Z�\92k�\9jv�h0��o��yߗ�F��/EZ��T�o��g�������dUZr�d,T?PR��k�����H�?L�mQ��Ƥ��/b�JՆ���DD��]�K�̿��NmI�]�^��~[��Io�{nU5j:uQ�O��[������Y͊YI�v��7�M��̶��Q#����5i���|�����&���3,CX���������mr��DX'��M5�7���#���&"�Y4�1��-��kly�dz/��k��y���:zAѢ@��o�a�1͘�֭R%Q鋤n �:����b�K��Q|=��'*��� w��[�{�nv\A����}���Aq������"��,��_z����c��4�@Z�>���E�2��uv�-�=Qe���,Ʌ��,��\*Qf+�q{Լ�~�o^��{�����O8�pN��O��ެl�w ԧg��v�g�ww��)��4�J��b(_().'_�ޖwJ��v��x�3!<Q�-|7�v���7��Q|Ʊ^���;��ޜ������p��4�6��E5(��'��|�z�
ɐ6:��h��q������Foyxg#�e蕣��j�IǤ�E�t�v��*�@`��2`s �U�ɷ1�K�W�����P���x��
{2j����!�b9�q/��0��/�uO�&��N�������H��S��2���}�EV��$�^\=}4���T�>�ʼ*�~ya�Ò��ı��T�W:��0o�<.����y�G+k�<(e۩��O�u-t��%�un>��Z�xWݨ\����]x�HzAU�Y������)\��msY��A��[Z�y���:v�'"J�����|R2Z���vA2�d�{�ܼ�Q�� �%i]�u��.�8��v���}�r(�;������͠�m4��쮑ٝ�?��]е�CJz�h}C �w��]һ�wU4�$��P�8��w��I"��~�߽Q.�w��/l�͆�yL�w��`dxa�nO)^�����mdx���蟨~�d���k�^�8^<q�m�dx�A��s�}��Ͻٰ웄��>{��P$|A5�n�c�+��6���u�;J�R����>km�0�� �qu������@ȋ����ŝϋ�i�$"1��	'1�+N��m����=�r%1��^*IZPj#w��8i����X0�?���7Z�y�vA^���{y�+9�o���,n����'�bݮ��Q���gC@�v�ߌ�V��8��׆�zLj���ک�/b��y)���y�V��LC�dx.���r�U$��DB�][G�Ĺ{��}J�_�k_�oeD@�ܶ3N�7�tL���{e�\�#��&	�L��&9��:��GO�g���$ϡ5�n��c��$��S�8D���c�T^���Z[��|��h=���/�q����Yy�s�-K����Ż��_�5&�I�v �9:>9{y��x�*��V�GC�8��k��!�����/��n��M��A���	e������k!E_���e}ѷ.��p]��4�AySf���ה}�Hj��T{���޿c�0c�������7r.7%r-y��)��f�o�;K�ݳ��7љ��&��u�|�6iV��|��=��ܞf���8�}���[�\�؝�:�gy�\���:,��.G����~3ۄ����a����G�e�G��T(X�aA��Ȱ�2��%H���Q�7�/� f?�y�F���M�Ｇ�l ��,[��E2��O����Z"H"]"]K�L�K�K��`�d2����@� ���0��� �H�:���(�2v��f@��'���k!�Q����$�ק���o.�OF�����O=M<%.2�xSo��{:�է��:��޲ϩ%ՊׅE��-;�c�,��?��	x��PM*�:��O��T���=��=���6/Jy.��?��q6�R�9�ru��~x-��'��a�q����:�ƻ<�����K|t�����%7��M|�4f�q�S�c�Q9<C���B�oZFc��N�ޛx�������0�qi��Ϳ�Z�oc��/�������gy����Y�d:�+U�C6��r,�^�a,�_��&Q���8*�{�R��T���*%gr�Ui(�����}�y����ˋ�P���G�{�S<��W�X��䦿Ҩ��*z�O�;���h.!���Q�^�p��=���c20���2G*K�b6�3�c!�����U�h�D��^arO������ｃc��`(�z�~�r,�A*KL��&�@���o1���X��i�b�r%6c�NیCl6�`3V�����^-��=kQ��(P�S�@61�������h;|彑y����c(���y�Y�<%E�M�Q���>�@-w���>�$�%S@P�*�b�+F49�ɵ坏\/t��������o������o������8�������4����A&b}�����K�_�k?eĻF�_�d�`L;�����M�̢ğ5rՍ�Y�W�d��T��^�#�'3�|���l�`h2�3vjWv
�PC\��j���MJ�oe�#<|�p�sSf^m5�,����b�~s��o=Y��^��,�JO������KO|z��˳8
����#�*�"C��EQ���	�L�4z%M�^1^1q�+��YV��0��I�@�]11�;����X�����/j��	<�8��?�(���ɏ�$�R�����C&��4�b��sD,U��DD1��Ed���K�ݶ�}���U7��b�eEvQ^	��?k��,����Q�k�\��.�R�`�Ǭ*�,��,��@��d	�������2�����{\������U�ɷy�/��w�h�X�HbY��C74�������e��������٫�m�U�@����-zZ�!�����߸��mk����1�#�E���v�q>�k����L�w5�J�)�J�{^iz�M[�B�)�Z�M�u�p�u���d�Ű��9O�8^�c�}���?U� ��<�����o�jb�����h5QK��J�I@/���r�Q�aH|>�?^=fܫ
z����հ�TZ"^�Ԑ�mRSJ��D)	�b�fJI.��>T�(�w���)C�]r�ʒ���@�,�	�m�72����J���WQsZ�Ø�4�9�t�,MdJ�	D�ASw2Q��ϯ>۠I퉸&�䶙L��
&X�M��0�\a
���9���7B1�]@P2b��B�[>�p�~�j�m`�E�Z!.8����j�� ��L���o�A����i�Hz??#9�!s�d�bHŐ�!,��&x�T]���'���]��ʡ���@��*�T
���a^�(�j�ʒ"5Dl1�8�j�F)��5ĩi�����	���m3�j"�D�����/SMt��x���;�� �=T��7B5�]@PM���P�WU4����D�8���I���PN�QN����z"�҆@�z"�Dꉰ��0SOt��xH= �=���7B=�]@PO���P����(EH�D	�D�7�D�p#m;T�A��!�z7fث����VHOxE"�x�BI�+#�<G�H���?D
t���M}��"�EX�Mp��/�\_,�I���;��7Bq�]@P\���P��k?�����j����dC�v:(*ރ(�s!��U�f���sO��^|�E�7��x��D�_{�H�X>�N~�?����?:���
��m3��"�E�����`1�mdU�(�7�` ���rRA�����+%鿯ڝJiI�QV�l]2�V�d\W��P};*fΊ�-/�&������v����H�2���P�a��{?�Sjyap񪟼IF����׃����p%��*JoP_J�Y�iy2�����[������kO;>*�K�Cߌ�7b ���t��aOV������SU����E�;U�fx�B��l���Z�.�܃(�/����Wf^�*Y�s(S��G����o��폞��^m�����N*%��!��7�n��\q�
� �bH�wv��)��4�J��b(_�0�r�U0z���๎�kB�ڷ��z�ġ�h��!j����#5ǅ���(?FE��6�:�"�M+���b|�]k!9���e}����ػ������ꗮ>Uk���^_x�,��\u�4$�4+�i�ЬP���� ;`o�$�I�L:Xl�g�7W�8������Sg2Z�u�vA��:�B��q�-�_i�kme&��7e&\q"�u,/e&�L���!/��*F�O��M���^���Ӫ��(���4�*�r/��@��Q�$U 9$o��ԕ���E7H�������u68��ٻ�ݶm(�*
���K�t�hڮ��vA��?����k�3E
eWo�gٓ���o7N�F���h�Ȗ�{x��=�h2��ð��76c��6�Ҁ��f���G4Hy��tR-ET���llQ/��A��H�*f�5�)�Q+Y21d�.2斶�(҅2,��+��k\f�㒍��Wޔ<I�l�Ʊ��V���a<�x��&ׯ�a<�x7�m�a����^����qi����1,�����ֹ�7B��R����xEutq#W���{>1���W�s�FzJ��*"���nPw��S�"LE01��~S�"x�q�l+�Tl6����LE��K��Ռ�ˎe�pR$�"�Edc�q�E*/��[쮷�q���<3���P����C�3�nz��S�p��\��q�ĵ��$1h�J��h�! 0�%�0���bh��rۀK�̀.$N^���l9��H�U��5?��0=d>3Ƕ����,��ĔN�E��s�u
�i�Nڰ;n+J���o�:���\��.�?C+@+@+�>���}��}�7x
<Ua���/|Z�6M|�����|&SF�>�^F|��b^����T�y;��.���b�����$�Dı���������M�B
S����劲~NQ���C��P1w��>���4�,��(���|+74*�J�f���Wϟ��܍����te�N�C�z!�C�G���W" �d���GZ0r\�_��*;��1p���"ic����U�%�X\���i�F���s ����CLoӕc��`�N����,׶��f���)�'�" ����|�r�����%�#줺i�vK"{��B�qd^@�B�v@��������$�Z�JO�����Ï"7C"V��n�|���Khg���Z]B H�s����_���;��K�x�S%�,�g����g
I�^�����ә���� ���C��X�j�Ǌ���B)e�gi&���[�j���Χ[7��-�xȀ�@X��_J�����M)�e�q֒���"bW,#���#c�V`+���;����n��~U�<���$��*l��3�&C�n��}߇�en7["����ցE^憒�FO�[�p������0���1������D������-:e-�Bo��)�8"fn-�h���{�m���!fۣ Se�<>R�`�Q��Jн9;�e�`�x�4c��
ف�YH�B�\�u�"3��d�6p�z��y��
��rtyڎ� ���e��_)�Mk�S��z��;����bS��/����c$m���[ioR_��4�V\a��/,b�QdtV2l���q��#���3�Rv���2� �
�wds�e��c	��.�SDp�^�4$%�]�v5
�_�2�ܸ��Ů�v&��iV��HxwH��j�Wџ�"oB@# �����V�P�*f���e[-Q�[�5����{4�ܺN�qsJ�
2��_\�R���@jHj�E[�ۈ��.�A��am[X���5���Mo"Ӯ*2��P�I³���R/T�≽�����d��O��7=����s���i<.˼с{3+�=z��0�?�<{�?�]����������L����e�����kI�s�����9��k���Qa�$b.�^��u�.�yN8��o���I;�M�?�m/��-EBʼ�  �� PK     ! �@�$  �     word/theme/theme1.xml�YM�7����;�3�X�㱝��MBv���<#�(֌�$�	���z)��C��PJ4����Ц?���c�l�K���5������H�z�,��	���k׮8���D(�����a�m[��,�d�k�!�����U���BK�glt���^��B��2����.�4�F�
�)���YM�l+�p{{<F!���K{�p>��_ƙl1=���f��Ѥ&�؜�Z' wm1NDN���-]�Qvu�jui��ے�P�-�Ѥ��h<Z���6���|7h���ҟ�03͹��^���{l	����~���K�xߓ�@y�����*�%P^�1i�W�+P^ln�[��w[^�����񚍠��2&�����a����P�����3�m���!�CP�e�O�� �FY(N���0��ԝ�����U%�A�:o
�F��c���)�ڟ
�v	��ի�'/ϟ�z������co�� Y\�{��W=������>�ڌge����x�����k��y�����~�Ǐ�p��Q~�RȬ[�ԺKR1A� pD���8�l�g1�6�'��``�����Tȅ	x}�P#|��G��$Հ�����9ݔc��0�b��tV����4v����l*�=2��Ѽ�E�A3�-�G&� �����02��d� 2����մ2��R�����ȷ���V�`��><ёbo lr	���`�AjdR\F ��H�i��q��bb"Ș��6�kto
�1���SI9�����2�O&Aҩ�3ʒ2�6KXw7� ��u��mM�}�t_���	2/�3��-���x�r^]��e����{�Oޅ����Ysw �f�e�ܧȸ��%|n]�B#���v̲;Pl���_���m?�^�W��.��u]�I�����#>��)egbz�P4��2Z>*LQ\��b
T٢��xr�����F���u̬)a�lP�F߲��C孵Z�t* _����h'�[���c�ҽ���q�  m߅Di0�D�@�U4^@B�l',:m�~+��Ȋ��?lxn�H�7�a$����y��S�v�0��些Lk$J�M'QZ�	��z�s�Y�T�'C�I��~��"��8�k֩�sO�	��k�ŭPө�Ǥng];�@�e�R���%9Lu��O���(k�������-9��\���"���I��1���UU��N����
�	�GItj���"P^�&!Ɨь--�U��j��_�V[�i'JY�s�*/�桘��J�/&3�e�.}�^l$;J��� ���Y?��!_b��}�U.��Z�)�n�)q��Dm5�FM26P[���vx!(�\��Έ]��VŽR�6^O��C����:Ü)��L<#�˹��B]θ5��k?r<��^Pq�ޠ�6\����F���Fm�՜~��X�'i�����<_�}Q�o`��}%$i��{pU�70���70�yԬ;�N�Y�4�a���ڕN��U�͠����>��v�F�6�J���H��N������������y�]�W���  �� PK     ! �����  
     word/settings.xml�V�n�8}_`�A��*��u
_�m��-*�(�������.��wH���,
w�>��3sf87���'F�=V�>���4�0�EC�v٬��8��Q��4>b�����7�Bcc@MG@�u��i�3F���w�!}%$� �B1dશ��c'�Z0��%�8��8�4bw��"a�VB��X�B�-���	����R���8��)� �����l ���{��3�Yz�sB5���g�5�
�h����+�g�W��?�Q�y���y���_�5�1��S��@��%)�R)�����`uq��B��B8������[��B��PH�j(5�H��@�E[d0�ZbJ���#�=[�t{�8����f���	J{��9��)T�J�j`[n��A��Y��((��pst:��L�G��b�֢�6�N��o��,?w��#;D�olKs�x���+���}�F7m?����z���%^ad:H�/r�*��D��RB��z�9#m�8 �kkh�����F���;8o#�4:>a�j����&��Z�d������YaW�'N�Q"�[,�A��.Ӂը���W��#eW0Iz@3D�
&) n�X�-��ug�Fj{���?�0����/%:٣�d� A%��%�恰 �]U+k��x�q�\�N�9
����p��'_J�0T���x���{��fӘ���d��n|sݥ�=6tذ����e��'�0������$��$˃,?��A6��L������V�
J�7�N�+Q��C/��
�%z�_�:��	�6n���2�4=�5>[s�M�Qt慮Ŭ�|�� ���0v-�M,v��ڱ<��ȯ��)�0�v�*`8,���a���g)�e��[a6��P�ϸ�#��Ӽ7�;�/��d��f��d4��d����.����'��l���4����  �� PK     ! f�DB�  E     word/fontTable.xmlܓ]k�0���B��e�M�Sh��`�bt?@��XTFG���c�IiX��]�#�Gz$=��F�����i:b�H+\��6����7w�@���Y�ӣ�����Y�� 8���V!ԋ$QI�a�ji�X:ox�W�M�/��F8S�6J�pL2�f����P\Y*!�9�3҆8>�R#�Y�T'Z�Z�|Q{'$ ���g��gL:� %�W�n�_QD��Ŗѯ��0@v�������F(1b�}k���$��U����c�fa���k��*jn�k{�s�2�fS|�����'Mڎ��d�:�..�Q�xJ�Q ]�VAT�|Ͻj�֕@m�����ӄ��i��]����e���>�ڹ�5��9am""'��GDιΙt.L<+#������W�dl�&��53d�G� #��&�w��bd���iWT<���?��ҿ�TY�/��ފh��Ꜽ�H�.b>TDwH����գ�:��G�o��   �� PK     ! Z]5�k  -    word/webSettings.xml��n^�q���=��h�#N�$HQ�(�&� Y�m��(�L���nJN��h�Y��hؤ?����8���9��|��?ܼ���{����<�������������7?�'��?<{���˻�7_<�����/~����w�����7翼��\���篞�䛇�7�?}z����W��z�����ï�޾z�p����O_={�����w��<{������÷OM��|��ۿ�*w_}u����w��������?}{��\����7�oڻ��j��޾x��������y^�|�W�n_��2u�W������}�����|xG��:߮��ի��@���_]��o~�%��%�����O>{��������g_�<W:?�g�]}�x�'??�����?|����/�x⭺;��\�y���_?����<ry��z�������W�ϯ�������˿�{��/�������{���_�x{}���y}������������ͳ�7�~~���������_����ُ��/?zG?�{�~�'�1����?�u;~��������p�ǛB�`�R����W���.���1�RS�� x,�,�������MŦ��IK^]T�y!y��/m����^z�HL~��;o�M~mF<��M�]7c�����Į:�K�h�b2��$&_�Jk�&��i5$�%�Sr�X����GlK��	�"v���]�s��?HL~Ǧ7�iJ8��
��G	&�5���<|ĬoѯA�W9ATI*>��������l��S�����G7֕yy8xK5/c�^���XЇ ���wu���߿I��-�Z�x�>�7߿'�j�i>�-wmვ�'�L@h�x
=$0x���(�cɷ���!x0x;�]}}�ɻ�{�й�׫L*�De$&/U�:Bc�&���[u2Ï&oֶ۬�G��B�j�%?-�â4��۔[���\���y4�kX�K	5&ߛ~���lВ�=�F��KT=*��&�~\K���.��<���5�+� -y7�T�ޣ�_cMF�	b0����|�M>�T��66��5p�oF�2I���2^��u��L؀ɛۺ��ր����c�)J4x��2[��@�7Y[�rz�`�ڌ���Ǯ��4w-��&x0�Y�u>��7�#x�bRL>�v�C�
^��o:�]|���uM��O޴"�~�D�L�M~¯�Cɣ%�3�Ws�c�w�\�a�p��f�+5��K�����[��0Q�䁾|��4Sex��R�����_�0֍������Gc�|L�F�|E��p�����Nm*��5��Γ<��L��ҡ��<�fs�Z�^nA�`�"~�<����jН�o��>�x0x+�*��M���Ô�JZ�ӫ����Į�y���T[f���M���DQ$�%���?6����<m�nv��8xi�k�9Ƀɛ�x8k����s�r "|xDxs|���	��^����c��F�=~?�<x�>�9���L&;?~��(��w��qgF�D��&�K�10@��������M�Nd \ˀ&�}�~���_�A2J�VM^%��8�$&_�{��3�&/�/WZ4�=�9+^���`��&?Q�<_��eSݗ�t��MmT������ ����䭢-�IM���5n�
0y����	�|xN�C�X�3v�/m��IJls,��L���5`��]b�f����uj������:5����|tS{W�8H�����|Z���{��A[��;o�yA�/ks:�`�Ww�7Ǎ��koO��0��ki[	}��]������פƔ;p��U ���(��#%�+"��Mr��W��O���G�Ϟ�aE,^���$�&�WC�8�F��7%lfy�����,ԛ�L������٠���U�v��N~4���X4��+�JN�+>s��#8y�(V��K�Z:+b��/�gJҳA���D-�����L��<�����<\�^ײH�ǒO�kbB������L��kw�Lspͻ�Y��F�p�*-��B4����<`ђ���cphl��c\Fw9�M~�-'�\��&�&�L�%�#U4�`��d�)e�1\�R�V��c4�մq�hW��WB�%Nh�붴�`�%�������[㄰J�`��r5�<X���kL����[�?~U�B��!`��9�4�f�
'rDo�L�����p3	�|�nDsZ|���+\�-U�r���q��A����*y����;ØF�����ܐ<�̟�5͔�����q�y��?�y=e�
&�v�� 
.�p;��(
M~�����d��i��46h�[���{��[��2='_���'�1�>�D�/ͩa]޳�Q�Pf����-B�O?qԲ��x�k�)�_���
4x]=�s�FM���*i�T�|M�n&=y0����G���C<|�Yr��'8]ۯ}�8����ȋ�ӗG�l̙b�7���6$XÊ&?�{��b�-��	K&������n4��gR����p�vUm�53p򓗹q�Q`�y�I�Mz6h�_i�Ta�N^l{S�ͣɛ�T��|N�3ǘ�Gs׬k��(0y��k�+G���j�V<��166ʔ������M��Zw��r�&oz�w<�5"nmYĊ�u�����Mjڢ��+����{��O>ʺ�9� M����&)��]u����}�Mf���`�א�����z�����˦Z&�_����'36x�e��'�"y,��q��28x�vc��ؚ�mo�G���FQh�==�l;�ۚ�>.%��>���X�!y4��
uer~��v��
��������K�h�&v�a<�ՙ�z�&y4y=��R�U�h�.��2�@��]�r>A��/Uα�K�s-V�fM�-��������qmhm���Td��T�Rf����{ɔ�0i&��)�+C�����G��ݸ�Wc�
&�qMQh����U�D�`#/��J[�'�5,��֦*瘜`� �y����fu���x�uS�ɧ��ex��o+OX4�=�Ѣ���}W��a4v�:.�0u '�.]�F�`�'�-�^Z��/;o̖������<�ʧgj]y0y���O�>G,gK���_��
>���/oebL�7��J�~㘛<v����ڒ~��{9�ߢ���Vy)���و݄�+����k��T��O>b�'�|�
&��%*���K�"�(JL~t<&��>U+͆�|`�+�lD�/���<����䣹~��=��L��O�tZ0U����y9=4y�N��co8�X9��,��+=d�IJ0w˸��&���w�Y�ؠ��5[~�Y�'o�r<z�ǒ{l�W����+�|;C����ΞH�%�|t�q�il��{ޏS!x��Ou�S��
'�VyȳxM�M{e�7^�iq� e���ʚi���*4{_?���و�R8y��u����L�ʘ�G�w��cq�/C���Rn*t��szԌ�pɷ�Nsh��FY&�(4�Jq�,Zy0�����V�䭴ͥ)y4��8�FX@'_����_�����.��ͣ��v���Y�'����8
M����������g�,��	�ڛ�O���W��`�>Z��)Bh�ǟ,�`1���LdD����	]u�FL~�z,8|��5z<J�(��=w+eC�ɯ]�#�׀����)E���Wӕ�U�؀ɧ�Er�=^�eue3 ���F�J1E��|g���'M�+Tj�QZ�������?�F'c�ڀɛj���p��Y��f)ᒿ��_�R0y�cjd����䏩�L�� Mޣe{؞��_eeZ� M~֮ ��9h�=�V�RJ��W���yJ8�T�f{P�x�ǳ����{��ؓ�	��^OE^�tMX@'�1=�B����Xz�@0��ci*9�.���u&�ђ/�l)�h��^[H����J5a��^t�5�h��\��P�Gē�I�>�ϑ�������o/�\!y4��h>�1}$&?�6��е��4�T����Wݎ����_�M��e�h�&�����M�X�=5���m4�ǭ
E�ok�܅�����^��ъ?�k�8�_��K���[����W3'�F�/�F��_���[X��&ojbi�V{4��J��t	4�)I�`�6�j��qC�|ǮG39���q�K96M~���F#��~Ϳu�'����-�h��:��̬O ��]����VioJ�DO���t|y�x� ��]"%��
�w����+����ɣ�_�B:\�1Z�=s-��s(4��T�nJ-�Jݫ��Mh���_[չ�M�Ů�
��Ah�k{��<����U6X:�|E�l,]J0y;QԖ'%���e�1�Z��r�0|��և�20x���[w��Lޮ���=��%�.�G	'_���T�&?�U�.���2��-L��ɛ�Q�:�y�槪e8JM�t׮�-���%Aɣɇֶ)��G��*�W���eR�x4�=嵗�94�k�w��ʣ��	_�G��	�Sz�%���>�&�}��9[����x�m<��׉_7�)C��<j���
&?r����%?��E�O^��Y�e�M>#��C�y4���I����m�׷��AK�W=���Z�"m�šYx���­�p�f�^��<\�Ǖ׍�	&���<g�����D0O�&�e2"��W4y�����g����ؒ$&oY;���K~\m�����姥�-�h�Y��N��%/)]�2 ���������۫ݥUq������w/����>�)�3y޻��{�����M��
�-������z(���=���1�kD��1�	�QQ�����M�������5���;<����ܳ:�fض&,�q/�%#5�N�L>ĤB����WC��c���u̜�+�ʔ�r��J��\��+�|U��㕏�ђ_��)����ϴ�ӥD��k͝zQ�`�]�-�y0x;.ez5�����qk�[�̕�%�a���<\�ݻ��#�'�VY,EF�/-K7vҢ���(#����5c$f���y|f�7@+>ZR���G���m��(4���S<_��Cz*��<Z�&}�$���2LR�ɻhvsK \�k:�~��`�^գ��AK��5�ƴ<���V���su�İ<_�����G�h�j��;� �����a	^���ݛ��W������_��{w���={���ݿ��?������7������	   �� PK     ! q4�|�  �   docProps/app.xml �(�                                                                                                                                                                                                                                                                 �S�n�0��?�7r�4�EŐb�a[�mϚL;�dI�Ԡ�׏�OY{�O�O��I���^G�AY�!�YI
0�6�t�P��H��i��6��������[>*J��!�ݚ� Ћ0�c�'������ڶUn�|��DZ���K�@s�&A2*���E+���X��qVCﴈ���?5��j��U�Bz
�Nt�|��ؓ�M������Ax!#��ϗ���f��VRDl-���������I��<��� ���'^2���2�M��џ���b�LN!�K�a����K�;i�;���c\AF닠~�x+R�R�6�(�&�1m�]���*jԞ��i9VK>\&��񥻡B�o�n������a���ɝ�k�����[L'��\moӆ���%���I���	9l˧U�/Av���B�S��2���u�����s�냴V���z��a������o   �� PK     ! �T�+p  �   docProps/core.xml �(�                                                                                                                                                                                                                                                                 ��_o�0�ߗ�;��c.��l3$K4Y2��y�ګvBi�*��W@pd>��ޞs\NOy��AQ�	
y Y��\O��2���3�JN�B���ir}3�Bó.h+�x�$M��m�UƆm �f�҉�B�ԺV���lK׀CBF8K9�W@_uDtBr�!�Ng5�3� ��� �g������˙{Tp�ڊ��`Dg,�rPk��?���K����UVPsYa3Hb|.]ev_��ls�5�f�-t2���?�i��gU�[8����M�:g�`�ʺ;l���Ψ�w�+��x��_�rk؋�=$A����n�pυ5����q�LQ�p䓱On�a�ۈ��j������?�OlM8����   �� PK     ! ��*  Sp     word/styles.xml��]sۺ��;����U{���g�9�ۉkO���i�!�P��ʏ��/ R�%(.���-Q� ċ������ϩ�~�*;M��"��*������ջ��(Y�0�2~6z����O��oO�E�"yi@V����hQ����<e�{��>8Wy�J�2�,���b�.Y)fB��e���w<j0y���E�?��JyV��qΥ&��X�e��=��=�<Y�*�E�O:�5/e"[c&� ��8W������45�(>ٳ��r8����8�Q�/)Ei|z󐩜ͤ&�S�t�"}�j&*��笒ea^�wy�ye�\��,��SV�B��ZhT*4��<+�H�(��Z.�?�G�t޾��M����_L����W�\�l�'Y��z�g�~Lݚ8o�4�l��w�s8nN������+[����%�ur�g�R_�}\��^�fU��B,���ƎA����{�6�>��_U�ȓi���lY��7w�P�6���-S�9婸I�3��B$��g?
�l����v��XU����db{�,�/�1_+�3�|3�|���m�V�I�D[��33�D��[}b�D�ٶ3�W�n?�*��
:|���ު��*��
��VY��� �%��6",Pwq<nDs<fCs<^Bs<VAs<N@s<���c4��M�Rž^�t�Oo���#¸���0�� ��{����ø���0���;��{��s�Vt�m���]6W��Tɣ�?��L�l�E�3��IN� S�l�D<�3�zw�&��K��Ej��C���|h�y��K�%G,I4����=-ҧs>�9�bNٱ�&��*���%{ c�,!n��dPXwh�?/�IA�NY���US�l|�*��me �E%%'b}��b�5<7��ᩁ��,fxb�hF�D���Q�54�v��'U�54�vkhD��І�۽(���UǤ��ݥTf[|p=��!cz0|�i�L�;����-�ٕnǺ�-�B%/�=Ŝ�&Q��m��g-�jx�nѨ̵��k�#2ؚ7�b�z�lh�4�̴������^��2Y���nc���1���2�c	z�7��5rR�|�Z�؆5�V�G%��5H�ZJ?���/K���q0�JI��xBG������k�}+I/�I�V�+m!�O����-[>�;�DF�ۗw)2�[A\��~���Ҥ��ah��,UJ�lv�����NS�s�g/Dg{N�=da��`��I*!"�e���jy��/3��v������,]֋o�q�I�?�!��˅��2�=	��6,�ٿy<|���"���?���?ڥ����_&l�/��zz0���d�p�OvGu�����^B�Q��G}�Ó�����畤k���W@�&T�J���-��-��|	���l�Y�?r���aaTJX�F����
0�6�66�^�F�p`T��t�'��������Q�3��gF��>G|>׋`�)�AR�9I7�d%O�*g����`�����jnnPY}7��QK��v���'��UͰ(�E�#ʤT�hom3����{�v��'9W�N��/�Lx�9'�Η��c��o��k��xX��t���w1�{;#W	�V�����x�<K[�-OD��*
�8>�l{�V�����Jb+�g$,�xw�f��y�3���g���Vd�>����#�t��u���|']�h�ZlWGZG�u���^�e��<����N?�������q��������W~D����_���AӖ��{��v�k���R������u��SV�s�����(�o��Í�{��#z@~D��������c��{��#У�p��ǍV0>d�����j�*����#�F��Q���QAx�Q!mT�@"�F�0�Qa<Ψ0>Ĩ�bTHA"�F��Q!mT�@5pm�2*���
h�Bڨv�8��0gTbTH	1*���
h�Bڨ�6*D��
(��� �B
ڨ�6*D��Z?jnT�3*�1*��R�F��Q!mT�@"�F��QAx�Q!mT�@"�F���
�C�
)!F��Q!mT�@"�F��Q!eTdTHA"�F�����\���f?��zz���骩�w�Qnu�������Y����l��"fR(�E���r�-��\v?���~�R�,��f
�}#���aW�w#A�w����H��<�}�H0v�֗��R�t���'x�	���p��]c�[�kdvaw��N�Qd���G=��x}) tuG�p�'tuK��j8���+���W=?���~JO//��V؏
��+u�Q��Ԑ$5��KQ�RCT��p`�J	X��g?!Hj�	������0��T���RCV��.5DKQaR��VjH�J	X�!!Hj�	������0�A����RCVjH�`¥��`�!�Kj���%5Ja'�sq������lɉ̖B`��Zi�˖\������	}e�Pzz1xa�(��~T�Ըl�M�p��	X�qْWj\��)5.[��-���eKmR㲥6��g?!Hj\��)5.[��-���eKmR㲥6�q�R��'d/&\j\��)5.[�K�˖ڤ�eKmR㲥6�qْWj\��)5.[��-���eKmR㲥6�q�R�Ըl�+5.[��-uJ�ɖ�O[?�d�����˗%7���<0���A�\��I�?�d�MM��'���m���u�6/tYq��I���oA]?�c��u���J��4���M�n.�֟ۺ��Y��4yG��$�mT���Ǧ��L�?ڥ���xj~���i��j�>~ɥ�e�����Q��e}t�g�u|V��7>��0ޮL����0O{���\��vI㆖涷Sm�M�V���  �� PK-      ! ߤ�lZ                      [Content_Types].xmlPK-      ! ���   N               �  _rels/.relsPK-      ! �d�Q�   1               �  word/_rels/document.xml.relsPK-      ! ��Z�<  *�              �  word/document.xmlPK-      ! �@�$  �               �E  word/theme/theme1.xmlPK-      ! �����  
               >L  word/settings.xmlPK-      ! f�DB�  E               1P  word/fontTable.xmlPK-      ! Z]5�k  -              IR  word/webSettings.xmlPK-      ! q4�|�  �               �f  docProps/app.xmlPK-      ! �T�+p  �               �i  docProps/core.xmlPK-      ! ��*  Sp               �l  word/styles.xmlPK      �  �w    
```


<div style='page-break-after: always;'></div>

# File: jubilee-cloud-foundation-key.pem

```pem
-----BEGIN RSA PRIVATE KEY-----
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
-----END RSA PRIVATE KEY-----

```


<div style='page-break-after: always;'></div>

# File: main.tf

```tf
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }

    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project            = var.project
      Environment        = var.environment
      Purpose            = "cloud-engineer-training"
      DataClassification = "internal"
      CostCenter         = "learning"
    }
  }
}

###############################################################
# Data sources
###############################################################

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

###############################################################
# Local values
###############################################################

locals {
  create_new_key = var.create_key_pair && var.existing_key_name == ""

  ssh_key_name = var.existing_key_name != "" ? var.existing_key_name : (
    local.create_new_key ? aws_key_pair.ssh[0].key_name : null
  )

  web_user_data = file("${path.module}/web_user_data.sh")

  iam_users = var.create_iam_users ? {
    "admin.lab" = [
      aws_iam_group.admins.name
    ]

    "engineer.lab" = [
      aws_iam_group.engineers.name
    ]

    "auditor.lab" = [
      aws_iam_group.auditors.name
    ]
  } : {}
}

###############################################################
# SSH key pair
###############################################################

resource "tls_private_key" "ssh" {
  count = local.create_new_key ? 1 : 0

  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ssh" {
  count = local.create_new_key ? 1 : 0

  key_name   = "${var.project}-key"
  public_key = tls_private_key.ssh[0].public_key_openssh

  tags = {
    Name = "${var.project}-key"
  }
}

resource "local_file" "ssh_private_key" {
  count = local.create_new_key ? 1 : 0

  filename        = "${path.module}/${var.project}-key.pem"
  content         = tls_private_key.ssh[0].private_key_pem
  file_permission = "0600"
}

###############################################################
# VPC
###############################################################

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project}-vpc"
  }
}

###############################################################
# Subnets
###############################################################

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-a"
  }
}

resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_cidr
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet-a"
  }
}

###############################################################
# Internet Gateway
###############################################################

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project}-igw"
  }
}

###############################################################
# Route Tables
###############################################################

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}

###############################################################
# Security Groups
###############################################################

resource "aws_security_group" "bastion" {
  name        = "${var.project}-bastion-sg"
  description = "Allow SSH only from administrator IP"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH from admin IP only"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-sg"
  }
}

resource "aws_security_group" "web" {
  name        = "${var.project}-web-sg"
  description = "Allow HTTP only from bastion security group"
  vpc_id      = aws_vpc.main.id

  egress {
    description = "Allow outbound traffic within VPC only"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_cidr]
  }

  tags = {
    Name = "web-sg"
  }
}

resource "aws_security_group_rule" "web_http_from_bastion" {
  type                     = "ingress"
  description              = "HTTP from bastion only"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.bastion.id
  security_group_id        = aws_security_group.web.id
}

###############################################################
# EC2 Instances
###############################################################

resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.amazon_linux_2023.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.bastion.id]
  associate_public_ip_address = true
  key_name                    = local.ssh_key_name

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 8
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name = "bastion"
  }

  depends_on = [
    aws_internet_gateway.main
  ]
}

resource "aws_instance" "web_private" {
  ami                         = data.aws_ami.amazon_linux_2023.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.private.id
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = false
  key_name                    = local.ssh_key_name

  user_data                   = local.web_user_data
  user_data_replace_on_change = true

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  root_block_device {
    volume_type           = "gp3"
    volume_size           = 8
    encrypted             = true
    delete_on_termination = true
  }

  tags = {
    Name = "web-private"
  }
}

###############################################################
# IAM Account Password Policy
###############################################################

resource "aws_iam_account_password_policy" "strict" {
  count = var.manage_password_policy ? 1 : 0

  minimum_password_length        = 14
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
  password_reuse_prevention      = 24
  max_password_age               = 90
}

###############################################################
# IAM Groups
###############################################################

resource "aws_iam_group" "admins" {
  name = "Admins"
}

resource "aws_iam_group" "engineers" {
  name = "CloudEngineers"
}

resource "aws_iam_group" "auditors" {
  name = "Auditors"
}

###############################################################
# IAM Group Policy Attachments
###############################################################

resource "aws_iam_group_policy_attachment" "admins_administrator_access" {
  group      = aws_iam_group.admins.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group_policy_attachment" "engineers_power_user_access" {
  group      = aws_iam_group.engineers.name
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

resource "aws_iam_group_policy_attachment" "engineers_iam_read_only" {
  group      = aws_iam_group.engineers.name
  policy_arn = "arn:aws:iam::aws:policy/IAMReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "engineers_change_own_password" {
  group      = aws_iam_group.engineers.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

resource "aws_iam_group_policy_attachment" "auditors_read_only" {
  group      = aws_iam_group.auditors.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "auditors_change_own_password" {
  group      = aws_iam_group.auditors.name
  policy_arn = "arn:aws:iam::aws:policy/IAMUserChangePassword"
}

###############################################################
# IAM Users
###############################################################

resource "aws_iam_user" "this" {
  for_each = local.iam_users

  name = each.key
}

resource "aws_iam_user_group_membership" "this" {
  for_each = local.iam_users

  user   = aws_iam_user.this[each.key].name
  groups = each.value
}

resource "aws_iam_user_login_profile" "this" {
  for_each = local.iam_users

  user                    = aws_iam_user.this[each.key].name
  password_length         = 16
  password_reset_required = true
}

###############################################################
# AWS Budget - FinOps / Cost Governance
###############################################################

resource "aws_budgets_budget" "learning" {
  count = var.create_budget && var.billing_alert_emails != "" ? 1 : 0

  name         = "${var.project}-learning-budget"
  budget_type  = "COST"
  limit_amount = var.monthly_budget_limit
  limit_unit   = "USD"
  time_unit    = "MONTHLY"

  notification {
    comparison_operator        = "GREATER_THAN"
    notification_type          = "ACTUAL"
    threshold                  = 80
    threshold_type             = "PERCENTAGE"
    subscriber_email_addresses = var.billing_alert_emails # Changed this line
  }

}
```


<div style='page-break-after: always;'></div>

# File: outputs.tf

```tf
output "vpc_id" {
  description = "ID of the custom VPC"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = aws_subnet.private.id
}

output "bastion_public_ip" {
  description = "Public IP address of the bastion server"
  value       = aws_instance.bastion.public_ip
}

output "bastion_public_dns" {
  description = "Public DNS name of the bastion server"
  value       = aws_instance.bastion.public_dns
}

output "web_private_ip" {
  description = "Private IP address of the private web server"
  value       = aws_instance.web_private.private_ip
}

output "ssh_private_key_file" {
  description = "Path to the generated private SSH key file"
  value       = local.create_new_key ? local_file.ssh_private_key[0].filename : null
}

output "ssh_command" {
  description = "SSH command to connect to the bastion server"
  value = local.create_new_key ? (
    "ssh -i ${local_file.ssh_private_key[0].filename} ec2-user@${aws_instance.bastion.public_dns}"
  ) : "ssh ec2-user@${aws_instance.bastion.public_dns}"
}

output "iam_user_passwords" {
  description = "Generated IAM console passwords. Use: terraform output -json iam_user_passwords"
  value = {
    for username, profile in aws_iam_user_login_profile.this :
    username => profile.password
  }
  sensitive = true
}
```


<div style='page-break-after: always;'></div>

# File: terraform.tfstate

```tfstate
{
  "version": 4,
  "terraform_version": "1.15.2",
  "serial": 291,
  "lineage": "597c692e-87ce-263f-33dd-9510c473fed4",
  "outputs": {},
  "resources": [],
  "check_results": [
    {
      "object_kind": "var",
      "config_addr": "var.my_ip",
      "status": "unknown",
      "objects": null
    }
  ]
}

```


<div style='page-break-after: always;'></div>

# File: terraform.tfstate.backup

```backup
{
  "version": 4,
  "terraform_version": "1.15.2",
  "serial": 253,
  "lineage": "597c692e-87ce-263f-33dd-9510c473fed4",
  "outputs": {
    "bastion_public_dns": {
      "value": "ec2-44-200-39-66.compute-1.amazonaws.com",
      "type": "string"
    },
    "bastion_public_ip": {
      "value": "44.200.39.66",
      "type": "string"
    },
    "iam_user_passwords": {
      "value": {
        "admin.lab": "pQII_7M)$W%33o!7",
        "auditor.lab": "E3|^PAaR#9F6'Qi@",
        "engineer.lab": "StOk49SFh|xj*+9F"
      },
      "type": [
        "object",
        {
          "admin.lab": "string",
          "auditor.lab": "string",
          "engineer.lab": "string"
        }
      ],
      "sensitive": true
    },
    "private_subnet_id": {
      "value": "subnet-0caf1424c1471b46d",
      "type": "string"
    },
    "public_subnet_id": {
      "value": "subnet-079333380cfc48a99",
      "type": "string"
    },
    "ssh_command": {
      "value": "ssh -i ./jubilee-cloud-foundation-key.pem ec2-user@ec2-44-200-39-66.compute-1.amazonaws.com",
      "type": "string"
    },
    "ssh_private_key_file": {
      "value": "./jubilee-cloud-foundation-key.pem",
      "type": "string"
    },
    "vpc_id": {
      "value": "vpc-058f393bddfe87490",
      "type": "string"
    },
    "web_private_ip": {
      "value": "10.0.2.26",
      "type": "string"
    }
  },
  "resources": [
    {
      "mode": "data",
      "type": "aws_ami",
      "name": "amazon_linux_2023",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "architecture": "x86_64",
            "arn": "arn:aws:ec2:us-east-1::image/ami-07a5b367e8dc8bd92",
            "block_device_mappings": [
              {
                "device_name": "/dev/xvda",
                "ebs": {
                  "delete_on_termination": "true",
                  "encrypted": "false",
                  "iops": "3000",
                  "snapshot_id": "snap-0d1a918f736429c43",
                  "throughput": "125",
                  "volume_initialization_rate": "0",
                  "volume_size": "8",
                  "volume_type": "gp3"
                },
                "no_device": "",
                "virtual_name": ""
              }
            ],
            "boot_mode": "uefi-preferred",
            "creation_date": "2026-08-03T17:39:25.000Z",
            "deprecation_time": "2026-11-01T17:47:00.000Z",
            "description": "Amazon Linux 2023 AMI 2023.12.20260803.3 x86_64 HVM kernel-6.1",
            "ena_support": true,
            "executable_users": null,
            "filter": [
              {
                "name": "architecture",
                "values": [
                  "x86_64"
                ]
              },
              {
                "name": "name",
                "values": [
                  "al2023-ami-2023*-x86_64"
                ]
              },
              {
                "name": "virtualization-type",
                "values": [
                  "hvm"
                ]
              }
            ],
            "hypervisor": "xen",
            "id": "ami-07a5b367e8dc8bd92",
            "image_id": "ami-07a5b367e8dc8bd92",
            "image_location": "amazon/al2023-ami-2023.12.20260803.3-kernel-6.1-x86_64",
            "image_owner_alias": "amazon",
            "image_type": "machine",
            "imds_support": "v2.0",
            "include_deprecated": false,
            "kernel_id": "",
            "last_launched_time": "",
            "most_recent": true,
            "name": "al2023-ami-2023.12.20260803.3-kernel-6.1-x86_64",
            "name_regex": null,
            "owner_id": "137112412989",
            "owners": [
              "amazon"
            ],
            "platform": "",
            "platform_details": "Linux/UNIX",
            "product_codes": [],
            "public": true,
            "ramdisk_id": "",
            "root_device_name": "/dev/xvda",
            "root_device_type": "ebs",
            "root_snapshot_id": "snap-0d1a918f736429c43",
            "sriov_net_support": "simple",
            "state": "available",
            "state_reason": {
              "code": "UNSET",
              "message": "UNSET"
            },
            "tags": {},
            "timeouts": null,
            "tpm_support": "",
            "uefi_data": null,
            "usage_operation": "RunInstances",
            "virtualization_type": "hvm"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0
        }
      ]
    },
    {
      "mode": "data",
      "type": "aws_availability_zones",
      "name": "available",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "all_availability_zones": null,
            "exclude_names": null,
            "exclude_zone_ids": null,
            "filter": null,
            "group_names": [
              "us-east-1-zg-1"
            ],
            "id": "us-east-1",
            "names": [
              "us-east-1a",
              "us-east-1b",
              "us-east-1c",
              "us-east-1d",
              "us-east-1e",
              "us-east-1f"
            ],
            "state": "available",
            "timeouts": null,
            "zone_ids": [
              "use1-az1",
              "use1-az2",
              "use1-az4",
              "use1-az6",
              "use1-az3",
              "use1-az5"
            ]
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_budgets_budget",
      "name": "learning",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "index_key": 0,
          "schema_version": 0,
          "attributes": {
            "account_id": "932453198323",
            "arn": "arn:aws:budgets::932453198323:budget/jubilee-cloud-foundation-learning-budget",
            "auto_adjust_data": [],
            "budget_type": "COST",
            "cost_filter": [],
            "cost_types": [
              {
                "include_credit": true,
                "include_discount": true,
                "include_other_subscription": true,
                "include_recurring": true,
                "include_refund": true,
                "include_subscription": true,
                "include_support": true,
                "include_tax": true,
                "include_upfront": true,
                "use_amortized": false,
                "use_blended": false
              }
            ],
            "id": "932453198323:jubilee-cloud-foundation-learning-budget",
            "limit_amount": "5.0",
            "limit_unit": "USD",
            "name": "jubilee-cloud-foundation-learning-budget",
            "name_prefix": "",
            "notification": [
              {
                "comparison_operator": "GREATER_THAN",
                "notification_type": "ACTUAL",
                "subscriber_email_addresses": [
                  "ahoosoftwares@gmail.com",
                  "ahootech@outlook.com",
                  "harryoduwor@gmail.com"
                ],
                "subscriber_sns_topic_arns": [],
                "threshold": 80,
                "threshold_type": "PERCENTAGE"
              }
            ],
            "planned_limit": [],
            "tags": null,
            "tags_all": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Project": "jubilee-cloud-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "time_period_end": "2087-06-15_00:00",
            "time_period_start": "2026-08-01_00:00",
            "time_unit": "MONTHLY"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA=="
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_iam_group",
      "name": "admins",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:iam::932453198323:group/Admins",
            "id": "Admins",
            "name": "Admins",
            "path": "/",
            "unique_id": "AGPA5SGUKVHZ4X4SF4F3S"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA=="
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_iam_group",
      "name": "auditors",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:iam::932453198323:group/Auditors",
            "id": "Auditors",
            "name": "Auditors",
            "path": "/",
            "unique_id": "AGPA5SGUKVHZSCTKD3QYA"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA=="
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_iam_group",
      "name": "engineers",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:iam::932453198323:group/CloudEngineers",
            "id": "CloudEngineers",
            "name": "CloudEngineers",
            "path": "/",
            "unique_id": "AGPA5SGUKVHZ7YKUFAQ3X"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA=="
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_iam_group_policy_attachment",
      "name": "admins_administrator_access",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "group": "Admins",
            "id": "Admins-20260806113212492700000006",
            "policy_arn": "arn:aws:iam::aws:policy/AdministratorAccess"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "aws_iam_group.admins"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_iam_group_policy_attachment",
      "name": "auditors_change_own_password",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "group": "Auditors",
            "id": "Auditors-20260806113212125600000002",
            "policy_arn": "arn:aws:iam::aws:policy/IAMUserChangePassword"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "aws_iam_group.auditors"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_iam_group_policy_attachment",
      "name": "auditors_read_only",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "group": "Auditors",
            "id": "Auditors-20260806113212213100000003",
            "policy_arn": "arn:aws:iam::aws:policy/ReadOnlyAccess"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "aws_iam_group.auditors"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_iam_group_policy_attachment",
      "name": "engineers_change_own_password",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "group": "CloudEngineers",
            "id": "CloudEngineers-20260806113212384400000004",
            "policy_arn": "arn:aws:iam::aws:policy/IAMUserChangePassword"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "aws_iam_group.engineers"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_iam_group_policy_attachment",
      "name": "engineers_iam_read_only",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "group": "CloudEngineers",
            "id": "CloudEngineers-20260806113212117400000001",
            "policy_arn": "arn:aws:iam::aws:policy/IAMReadOnlyAccess"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "aws_iam_group.engineers"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_iam_group_policy_attachment",
      "name": "engineers_power_user_access",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "group": "CloudEngineers",
            "id": "CloudEngineers-20260806113212393000000005",
            "policy_arn": "arn:aws:iam::aws:policy/PowerUserAccess"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "aws_iam_group.engineers"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_iam_user",
      "name": "this",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "index_key": "admin.lab",
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:iam::932453198323:user/admin.lab",
            "force_destroy": false,
            "id": "admin.lab",
            "name": "admin.lab",
            "path": "/",
            "permissions_boundary": "",
            "tags": null,
            "tags_all": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Project": "jubilee-cloud-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "unique_id": "AIDA5SGUKVHZZZITYVA5R"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "aws_iam_group.admins",
            "aws_iam_group.auditors",
            "aws_iam_group.engineers"
          ]
        },
        {
          "index_key": "auditor.lab",
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:iam::932453198323:user/auditor.lab",
            "force_destroy": false,
            "id": "auditor.lab",
            "name": "auditor.lab",
            "path": "/",
            "permissions_boundary": "",
            "tags": null,
            "tags_all": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Project": "jubilee-cloud-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "unique_id": "AIDA5SGUKVHZZKLCY44CB"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "aws_iam_group.admins",
            "aws_iam_group.auditors",
            "aws_iam_group.engineers"
          ]
        },
        {
          "index_key": "engineer.lab",
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:iam::932453198323:user/engineer.lab",
            "force_destroy": false,
            "id": "engineer.lab",
            "name": "engineer.lab",
            "path": "/",
            "permissions_boundary": "",
            "tags": null,
            "tags_all": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Project": "jubilee-cloud-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "unique_id": "AIDA5SGUKVHZQBVQ63V3E"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "aws_iam_group.admins",
            "aws_iam_group.auditors",
            "aws_iam_group.engineers"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_iam_user_group_membership",
      "name": "this",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "index_key": "admin.lab",
          "schema_version": 0,
          "attributes": {
            "groups": [
              "Admins"
            ],
            "id": "terraform-20260806113213462700000007",
            "user": "admin.lab"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "aws_iam_group.admins",
            "aws_iam_group.auditors",
            "aws_iam_group.engineers",
            "aws_iam_user.this"
          ]
        },
        {
          "index_key": "auditor.lab",
          "schema_version": 0,
          "attributes": {
            "groups": [
              "Auditors"
            ],
            "id": "terraform-20260806113213476000000009",
            "user": "auditor.lab"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "aws_iam_group.admins",
            "aws_iam_group.auditors",
            "aws_iam_group.engineers",
            "aws_iam_user.this"
          ]
        },
        {
          "index_key": "engineer.lab",
          "schema_version": 0,
          "attributes": {
            "groups": [
              "CloudEngineers"
            ],
            "id": "terraform-20260806113213466700000008",
            "user": "engineer.lab"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "aws_iam_group.admins",
            "aws_iam_group.auditors",
            "aws_iam_group.engineers",
            "aws_iam_user.this"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_iam_user_login_profile",
      "name": "this",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "index_key": "admin.lab",
          "schema_version": 0,
          "attributes": {
            "encrypted_password": null,
            "id": "admin.lab",
            "key_fingerprint": null,
            "password": "pQII_7M)$W%33o!7",
            "password_length": 16,
            "password_reset_required": true,
            "pgp_key": null,
            "user": "admin.lab"
          },
          "sensitive_attributes": [
            [
              {
                "type": "get_attr",
                "value": "password"
              }
            ]
          ],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "aws_iam_group.admins",
            "aws_iam_group.auditors",
            "aws_iam_group.engineers",
            "aws_iam_user.this"
          ]
        },
        {
          "index_key": "auditor.lab",
          "schema_version": 0,
          "attributes": {
            "encrypted_password": null,
            "id": "auditor.lab",
            "key_fingerprint": null,
            "password": "E3|^PAaR#9F6'Qi@",
            "password_length": 16,
            "password_reset_required": true,
            "pgp_key": null,
            "user": "auditor.lab"
          },
          "sensitive_attributes": [
            [
              {
                "type": "get_attr",
                "value": "password"
              }
            ]
          ],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "aws_iam_group.admins",
            "aws_iam_group.auditors",
            "aws_iam_group.engineers",
            "aws_iam_user.this"
          ]
        },
        {
          "index_key": "engineer.lab",
          "schema_version": 0,
          "attributes": {
            "encrypted_password": null,
            "id": "engineer.lab",
            "key_fingerprint": null,
            "password": "StOk49SFh|xj*+9F",
            "password_length": 16,
            "password_reset_required": true,
            "pgp_key": null,
            "user": "engineer.lab"
          },
          "sensitive_attributes": [
            [
              {
                "type": "get_attr",
                "value": "password"
              }
            ]
          ],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "aws_iam_group.admins",
            "aws_iam_group.auditors",
            "aws_iam_group.engineers",
            "aws_iam_user.this"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_instance",
      "name": "bastion",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "ami": "ami-07a5b367e8dc8bd92",
            "arn": "arn:aws:ec2:us-east-1:932453198323:instance/i-06ed8fbde77584dea",
            "associate_public_ip_address": true,
            "availability_zone": "us-east-1a",
            "capacity_reservation_specification": [
              {
                "capacity_reservation_preference": "open",
                "capacity_reservation_target": []
              }
            ],
            "cpu_core_count": 1,
            "cpu_options": [
              {
                "amd_sev_snp": "",
                "core_count": 1,
                "threads_per_core": 1
              }
            ],
            "cpu_threads_per_core": 1,
            "credit_specification": [
              {
                "cpu_credits": "standard"
              }
            ],
            "disable_api_stop": false,
            "disable_api_termination": false,
            "ebs_block_device": [],
            "ebs_optimized": false,
            "enable_primary_ipv6": null,
            "enclave_options": [
              {
                "enabled": false
              }
            ],
            "ephemeral_block_device": [],
            "get_password_data": false,
            "hibernation": false,
            "host_id": "",
            "host_resource_group_arn": null,
            "iam_instance_profile": "",
            "id": "i-06ed8fbde77584dea",
            "instance_initiated_shutdown_behavior": "stop",
            "instance_lifecycle": "",
            "instance_market_options": [],
            "instance_state": "running",
            "instance_type": "t2.micro",
            "ipv6_address_count": 0,
            "ipv6_addresses": [],
            "key_name": "jubilee-cloud-foundation-key",
            "launch_template": [],
            "maintenance_options": [
              {
                "auto_recovery": "default"
              }
            ],
            "metadata_options": [
              {
                "http_endpoint": "enabled",
                "http_protocol_ipv6": "disabled",
                "http_put_response_hop_limit": 1,
                "http_tokens": "required",
                "instance_metadata_tags": "disabled"
              }
            ],
            "monitoring": false,
            "network_interface": [],
            "outpost_arn": "",
            "password_data": "",
            "placement_group": "",
            "placement_partition_number": 0,
            "primary_network_interface_id": "eni-05c05991506ca0436",
            "private_dns": "ip-10-0-1-233.ec2.internal",
            "private_dns_name_options": [
              {
                "enable_resource_name_dns_a_record": false,
                "enable_resource_name_dns_aaaa_record": false,
                "hostname_type": "ip-name"
              }
            ],
            "private_ip": "10.0.1.233",
            "public_dns": "ec2-44-200-39-66.compute-1.amazonaws.com",
            "public_ip": "44.200.39.66",
            "root_block_device": [
              {
                "delete_on_termination": true,
                "device_name": "/dev/xvda",
                "encrypted": true,
                "iops": 3000,
                "kms_key_id": "arn:aws:kms:us-east-1:932453198323:key/b6b4335b-a207-4975-8e7c-ceef0c5352ce",
                "tags": null,
                "tags_all": {
                  "CostCenter": "learning",
                  "DataClassification": "internal",
                  "Environment": "dev",
                  "Project": "jubilee-cloud-foundation",
                  "Purpose": "cloud-engineer-training"
                },
                "throughput": 125,
                "volume_id": "vol-01c00c4bb4cb89dea",
                "volume_size": 8,
                "volume_type": "gp3"
              }
            ],
            "secondary_private_ips": [],
            "security_groups": [],
            "source_dest_check": true,
            "spot_instance_request_id": "",
            "subnet_id": "subnet-079333380cfc48a99",
            "tags": {
              "Name": "bastion"
            },
            "tags_all": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Name": "bastion",
              "Project": "jubilee-cloud-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "tenancy": "default",
            "timeouts": null,
            "user_data": null,
            "user_data_base64": null,
            "user_data_replace_on_change": false,
            "volume_tags": null,
            "vpc_security_group_ids": [
              "sg-0fba5c33c61dbc732"
            ]
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMCwicmVhZCI6OTAwMDAwMDAwMDAwLCJ1cGRhdGUiOjYwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9",
          "dependencies": [
            "aws_internet_gateway.main",
            "aws_key_pair.ssh",
            "aws_security_group.bastion",
            "aws_subnet.public",
            "aws_vpc.main",
            "data.aws_ami.amazon_linux_2023",
            "data.aws_availability_zones.available",
            "tls_private_key.ssh"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_instance",
      "name": "web_private",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "ami": "ami-07a5b367e8dc8bd92",
            "arn": "arn:aws:ec2:us-east-1:932453198323:instance/i-0dac6fe7df66dd7cd",
            "associate_public_ip_address": false,
            "availability_zone": "us-east-1a",
            "capacity_reservation_specification": [
              {
                "capacity_reservation_preference": "open",
                "capacity_reservation_target": []
              }
            ],
            "cpu_core_count": 1,
            "cpu_options": [
              {
                "amd_sev_snp": "",
                "core_count": 1,
                "threads_per_core": 1
              }
            ],
            "cpu_threads_per_core": 1,
            "credit_specification": [
              {
                "cpu_credits": "standard"
              }
            ],
            "disable_api_stop": false,
            "disable_api_termination": false,
            "ebs_block_device": [],
            "ebs_optimized": false,
            "enable_primary_ipv6": null,
            "enclave_options": [
              {
                "enabled": false
              }
            ],
            "ephemeral_block_device": [],
            "get_password_data": false,
            "hibernation": false,
            "host_id": "",
            "host_resource_group_arn": null,
            "iam_instance_profile": "",
            "id": "i-0dac6fe7df66dd7cd",
            "instance_initiated_shutdown_behavior": "stop",
            "instance_lifecycle": "",
            "instance_market_options": [],
            "instance_state": "running",
            "instance_type": "t2.micro",
            "ipv6_address_count": 0,
            "ipv6_addresses": [],
            "key_name": "jubilee-cloud-foundation-key",
            "launch_template": [],
            "maintenance_options": [
              {
                "auto_recovery": "default"
              }
            ],
            "metadata_options": [
              {
                "http_endpoint": "enabled",
                "http_protocol_ipv6": "disabled",
                "http_put_response_hop_limit": 1,
                "http_tokens": "required",
                "instance_metadata_tags": "disabled"
              }
            ],
            "monitoring": false,
            "network_interface": [],
            "outpost_arn": "",
            "password_data": "",
            "placement_group": "",
            "placement_partition_number": 0,
            "primary_network_interface_id": "eni-0579dc416a8ee2eda",
            "private_dns": "ip-10-0-2-26.ec2.internal",
            "private_dns_name_options": [
              {
                "enable_resource_name_dns_a_record": false,
                "enable_resource_name_dns_aaaa_record": false,
                "hostname_type": "ip-name"
              }
            ],
            "private_ip": "10.0.2.26",
            "public_dns": "",
            "public_ip": "",
            "root_block_device": [
              {
                "delete_on_termination": true,
                "device_name": "/dev/xvda",
                "encrypted": true,
                "iops": 3000,
                "kms_key_id": "arn:aws:kms:us-east-1:932453198323:key/b6b4335b-a207-4975-8e7c-ceef0c5352ce",
                "tags": null,
                "tags_all": {
                  "CostCenter": "learning",
                  "DataClassification": "internal",
                  "Environment": "dev",
                  "Project": "jubilee-cloud-foundation",
                  "Purpose": "cloud-engineer-training"
                },
                "throughput": 125,
                "volume_id": "vol-0bbff98758cbc336a",
                "volume_size": 8,
                "volume_type": "gp3"
              }
            ],
            "secondary_private_ips": [],
            "security_groups": [],
            "source_dest_check": true,
            "spot_instance_request_id": "",
            "subnet_id": "subnet-0caf1424c1471b46d",
            "tags": {
              "Name": "web-private"
            },
            "tags_all": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Name": "web-private",
              "Project": "jubilee-cloud-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "tenancy": "default",
            "timeouts": null,
            "user_data": "5e0424d2c5b0ce5f0e981066b312d0af6f767d86",
            "user_data_base64": null,
            "user_data_replace_on_change": true,
            "volume_tags": null,
            "vpc_security_group_ids": [
              "sg-0fce279c206e2e56e"
            ]
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMCwicmVhZCI6OTAwMDAwMDAwMDAwLCJ1cGRhdGUiOjYwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9",
          "dependencies": [
            "aws_key_pair.ssh",
            "aws_security_group.web",
            "aws_subnet.private",
            "aws_vpc.main",
            "data.aws_ami.amazon_linux_2023",
            "data.aws_availability_zones.available",
            "tls_private_key.ssh"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_internet_gateway",
      "name": "main",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:932453198323:internet-gateway/igw-05a8ccd5a0d8641cf",
            "id": "igw-05a8ccd5a0d8641cf",
            "owner_id": "932453198323",
            "tags": {
              "Name": "jubilee-cloud-foundation-igw"
            },
            "tags_all": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Name": "jubilee-cloud-foundation-igw",
              "Project": "jubilee-cloud-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "timeouts": null,
            "vpc_id": "vpc-058f393bddfe87490"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH19",
          "dependencies": [
            "aws_vpc.main"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_key_pair",
      "name": "ssh",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "index_key": 0,
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:932453198323:key-pair/jubilee-cloud-foundation-key",
            "fingerprint": "0c:86:04:fc:b9:6e:69:db:6f:7d:ca:91:5f:b6:c7:18",
            "id": "jubilee-cloud-foundation-key",
            "key_name": "jubilee-cloud-foundation-key",
            "key_name_prefix": "",
            "key_pair_id": "key-05eb24469936ca21d",
            "key_type": "rsa",
            "public_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDif3eSVOcUEALG/wd6mPpY/qa3m9a2Fs9Iby9+iAMCWdK7HdxhfTROYDspbzlYwy2DjadTlJDPflKW2HdWTZbY5ZHIJSxzqJSJVMrSOqVQmmGLWJwOP0aA3uB2HCcqUatE2SdeRSQ9B9nDoZ8GWgDv7sCWJS0R10pSt/Cmk0BIPm0cs6oJ5hIThnMtSGGBs7PfiAQShhsSNZVGA6/mtpAWwRIK6HyMuqK5naoKB+1qLW2fii4ADsecQk7Kzn2XLnqTNq1ZiciF7kEq6jGeQba1F8HcbcX9pLcxgK/knytESgelaHjbQgh2trtioHxDPf+chQav5O23mvQ1KybNq/GKndnGS11XpAbWjU1sXlskKVyMpxKqQTu6hbvsSJQZqlSH4OWVt3trm5Tyf9AqUeEJQQfYR26jx7cUtyUHazbytkqwvMjm3MBQ9NYMFX+3LSUXCCwp3ZuDKHEzT+sqf9YjKRT79TF7sOxZPXkbxRrcWaPKaysS4rF+iM57UZ883Bp502n1T9Lnw5GTDyhQG7PASwLHpyMI0bpFczJQ4CiyErEnERig05viUVyq00Yy6JjpNhs65CwPm9tq/zg5fLiq2CQUaOvCsEtNMOCb2t43Ed4yPap1xG4fo1GCpXk/7tWB0XzwK8C5xpp5ctVOMmSBbjG10Z0EfKLRyeyiydNKBw==",
            "tags": {
              "Name": "jubilee-cloud-foundation-key"
            },
            "tags_all": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Name": "jubilee-cloud-foundation-key",
              "Project": "jubilee-cloud-foundation",
              "Purpose": "cloud-engineer-training"
            }
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJzY2hlbWFfdmVyc2lvbiI6IjEifQ==",
          "dependencies": [
            "tls_private_key.ssh"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_route_table",
      "name": "private",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:932453198323:route-table/rtb-00fa251b5dffd0d22",
            "id": "rtb-00fa251b5dffd0d22",
            "owner_id": "932453198323",
            "propagating_vgws": [],
            "route": [],
            "tags": {
              "Name": "private-rt"
            },
            "tags_all": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Name": "private-rt",
              "Project": "jubilee-cloud-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "timeouts": null,
            "vpc_id": "vpc-058f393bddfe87490"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDAsImRlbGV0ZSI6MzAwMDAwMDAwMDAwLCJ1cGRhdGUiOjEyMDAwMDAwMDAwMH19",
          "dependencies": [
            "aws_vpc.main"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_route_table",
      "name": "public",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:932453198323:route-table/rtb-0c1a904b0e8bc5dca",
            "id": "rtb-0c1a904b0e8bc5dca",
            "owner_id": "932453198323",
            "propagating_vgws": [],
            "route": [
              {
                "carrier_gateway_id": "",
                "cidr_block": "0.0.0.0/0",
                "core_network_arn": "",
                "destination_prefix_list_id": "",
                "egress_only_gateway_id": "",
                "gateway_id": "igw-05a8ccd5a0d8641cf",
                "ipv6_cidr_block": "",
                "local_gateway_id": "",
                "nat_gateway_id": "",
                "network_interface_id": "",
                "transit_gateway_id": "",
                "vpc_endpoint_id": "",
                "vpc_peering_connection_id": ""
              }
            ],
            "tags": {
              "Name": "public-rt"
            },
            "tags_all": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Name": "public-rt",
              "Project": "jubilee-cloud-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "timeouts": null,
            "vpc_id": "vpc-058f393bddfe87490"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDAsImRlbGV0ZSI6MzAwMDAwMDAwMDAwLCJ1cGRhdGUiOjEyMDAwMDAwMDAwMH19",
          "dependencies": [
            "aws_internet_gateway.main",
            "aws_vpc.main"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_route_table_association",
      "name": "private",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "gateway_id": "",
            "id": "rtbassoc-0560c00c6f24c3c5a",
            "route_table_id": "rtb-00fa251b5dffd0d22",
            "subnet_id": "subnet-0caf1424c1471b46d",
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDAsImRlbGV0ZSI6MzAwMDAwMDAwMDAwLCJ1cGRhdGUiOjEyMDAwMDAwMDAwMH19",
          "dependencies": [
            "aws_route_table.private",
            "aws_subnet.private",
            "aws_vpc.main",
            "data.aws_availability_zones.available"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_route_table_association",
      "name": "public",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "gateway_id": "",
            "id": "rtbassoc-0b90a433edf001e68",
            "route_table_id": "rtb-0c1a904b0e8bc5dca",
            "subnet_id": "subnet-079333380cfc48a99",
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDAsImRlbGV0ZSI6MzAwMDAwMDAwMDAwLCJ1cGRhdGUiOjEyMDAwMDAwMDAwMH19",
          "dependencies": [
            "aws_internet_gateway.main",
            "aws_route_table.public",
            "aws_subnet.public",
            "aws_vpc.main",
            "data.aws_availability_zones.available"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_security_group",
      "name": "bastion",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:932453198323:security-group/sg-0fba5c33c61dbc732",
            "description": "Allow SSH only from administrator IP",
            "egress": [
              {
                "cidr_blocks": [
                  "0.0.0.0/0"
                ],
                "description": "Allow all outbound traffic",
                "from_port": 0,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "-1",
                "security_groups": [],
                "self": false,
                "to_port": 0
              }
            ],
            "id": "sg-0fba5c33c61dbc732",
            "ingress": [
              {
                "cidr_blocks": [
                  "41.139.243.97/32"
                ],
                "description": "SSH from admin IP only",
                "from_port": 22,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "tcp",
                "security_groups": [],
                "self": false,
                "to_port": 22
              }
            ],
            "name": "jubilee-cloud-foundation-bastion-sg",
            "name_prefix": "",
            "owner_id": "932453198323",
            "revoke_rules_on_delete": false,
            "tags": {
              "Name": "bastion-sg"
            },
            "tags_all": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Name": "bastion-sg",
              "Project": "jubilee-cloud-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "timeouts": null,
            "vpc_id": "vpc-058f393bddfe87490"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6OTAwMDAwMDAwMDAwfSwic2NoZW1hX3ZlcnNpb24iOiIxIn0=",
          "dependencies": [
            "aws_vpc.main"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_security_group",
      "name": "web",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:932453198323:security-group/sg-0fce279c206e2e56e",
            "description": "Allow HTTP only from bastion security group",
            "egress": [
              {
                "cidr_blocks": [
                  "10.0.0.0/16"
                ],
                "description": "Allow outbound traffic within VPC only",
                "from_port": 0,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "-1",
                "security_groups": [],
                "self": false,
                "to_port": 0
              }
            ],
            "id": "sg-0fce279c206e2e56e",
            "ingress": [],
            "name": "jubilee-cloud-foundation-web-sg",
            "name_prefix": "",
            "owner_id": "932453198323",
            "revoke_rules_on_delete": false,
            "tags": {
              "Name": "web-sg"
            },
            "tags_all": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Name": "web-sg",
              "Project": "jubilee-cloud-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "timeouts": null,
            "vpc_id": "vpc-058f393bddfe87490"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6OTAwMDAwMDAwMDAwfSwic2NoZW1hX3ZlcnNpb24iOiIxIn0=",
          "dependencies": [
            "aws_vpc.main"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_security_group_rule",
      "name": "web_http_from_bastion",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 2,
          "attributes": {
            "cidr_blocks": null,
            "description": "HTTP from bastion only",
            "from_port": 80,
            "id": "sgrule-865768576",
            "ipv6_cidr_blocks": null,
            "prefix_list_ids": null,
            "protocol": "tcp",
            "security_group_id": "sg-0fce279c206e2e56e",
            "security_group_rule_id": "sgr-03826d5f0de6bb822",
            "self": false,
            "source_security_group_id": "sg-0fba5c33c61dbc732",
            "timeouts": null,
            "to_port": 80,
            "type": "ingress"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDB9LCJzY2hlbWFfdmVyc2lvbiI6IjIifQ==",
          "dependencies": [
            "aws_security_group.bastion",
            "aws_security_group.web",
            "aws_vpc.main"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_subnet",
      "name": "private",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:932453198323:subnet/subnet-0caf1424c1471b46d",
            "assign_ipv6_address_on_creation": false,
            "availability_zone": "us-east-1a",
            "availability_zone_id": "use1-az1",
            "cidr_block": "10.0.2.0/24",
            "customer_owned_ipv4_pool": "",
            "enable_dns64": false,
            "enable_lni_at_device_index": 0,
            "enable_resource_name_dns_a_record_on_launch": false,
            "enable_resource_name_dns_aaaa_record_on_launch": false,
            "id": "subnet-0caf1424c1471b46d",
            "ipv6_cidr_block": "",
            "ipv6_cidr_block_association_id": "",
            "ipv6_native": false,
            "map_customer_owned_ip_on_launch": false,
            "map_public_ip_on_launch": false,
            "outpost_arn": "",
            "owner_id": "932453198323",
            "private_dns_hostname_type_on_launch": "ip-name",
            "tags": {
              "Name": "private-subnet-a"
            },
            "tags_all": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Name": "private-subnet-a",
              "Project": "jubilee-cloud-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "timeouts": null,
            "vpc_id": "vpc-058f393bddfe87490"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9",
          "dependencies": [
            "aws_vpc.main",
            "data.aws_availability_zones.available"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_subnet",
      "name": "public",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:932453198323:subnet/subnet-079333380cfc48a99",
            "assign_ipv6_address_on_creation": false,
            "availability_zone": "us-east-1a",
            "availability_zone_id": "use1-az1",
            "cidr_block": "10.0.1.0/24",
            "customer_owned_ipv4_pool": "",
            "enable_dns64": false,
            "enable_lni_at_device_index": 0,
            "enable_resource_name_dns_a_record_on_launch": false,
            "enable_resource_name_dns_aaaa_record_on_launch": false,
            "id": "subnet-079333380cfc48a99",
            "ipv6_cidr_block": "",
            "ipv6_cidr_block_association_id": "",
            "ipv6_native": false,
            "map_customer_owned_ip_on_launch": false,
            "map_public_ip_on_launch": true,
            "outpost_arn": "",
            "owner_id": "932453198323",
            "private_dns_hostname_type_on_launch": "ip-name",
            "tags": {
              "Name": "public-subnet-a"
            },
            "tags_all": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Name": "public-subnet-a",
              "Project": "jubilee-cloud-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "timeouts": null,
            "vpc_id": "vpc-058f393bddfe87490"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9",
          "dependencies": [
            "aws_vpc.main",
            "data.aws_availability_zones.available"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_vpc",
      "name": "main",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:932453198323:vpc/vpc-058f393bddfe87490",
            "assign_generated_ipv6_cidr_block": false,
            "cidr_block": "10.0.0.0/16",
            "default_network_acl_id": "acl-0b1b56507d8e3b282",
            "default_route_table_id": "rtb-0b56af1653fc992a9",
            "default_security_group_id": "sg-025ad4d01f5642214",
            "dhcp_options_id": "dopt-06602ef479c9aead2",
            "enable_dns_hostnames": true,
            "enable_dns_support": true,
            "enable_network_address_usage_metrics": false,
            "id": "vpc-058f393bddfe87490",
            "instance_tenancy": "default",
            "ipv4_ipam_pool_id": null,
            "ipv4_netmask_length": null,
            "ipv6_association_id": "",
            "ipv6_cidr_block": "",
            "ipv6_cidr_block_network_border_group": "",
            "ipv6_ipam_pool_id": "",
            "ipv6_netmask_length": 0,
            "main_route_table_id": "rtb-0b56af1653fc992a9",
            "owner_id": "932453198323",
            "tags": {
              "Name": "jubilee-cloud-foundation-vpc"
            },
            "tags_all": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Name": "jubilee-cloud-foundation-vpc",
              "Project": "jubilee-cloud-foundation",
              "Purpose": "cloud-engineer-training"
            }
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJzY2hlbWFfdmVyc2lvbiI6IjEifQ=="
        }
      ]
    },
    {
      "mode": "managed",
      "type": "local_file",
      "name": "ssh_private_key",
      "provider": "provider[\"registry.terraform.io/hashicorp/local\"]",
      "instances": [
        {
          "index_key": 0,
          "schema_version": 0,
          "attributes": {
            "content": "-----BEGIN RSA PRIVATE KEY-----\n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\n-----END RSA PRIVATE KEY-----\n",
            "content_base64": null,
            "content_base64sha256": "BLfYCLumy2Sod5j2HTEyqY3FowuYwOXwDstdL5aj+I8=",
            "content_base64sha512": "0aet9w9r8mDOhotTC6jgyGAhuPTS3b/FKQ6miW53GlDAgyBnQW0kmp2Jyi6YR+3c5CkwDrA313CsBOXKlzjIUQ==",
            "content_md5": "effd2dd129adc171a4fc76dbbe71adb6",
            "content_sha1": "031310b1a731a4f270ad46ff12f370704b034834",
            "content_sha256": "04b7d808bba6cb64a87798f61d3132a98dc5a30b98c0e5f00ecb5d2f96a3f88f",
            "content_sha512": "d1a7adf70f6bf260ce868b530ba8e0c86021b8f4d2ddbfc5290ea6896e771a50c0832067416d249a9d89ca2e9847eddce429300eb037d770ac04e5ca9738c851",
            "directory_permission": "0777",
            "file_permission": "0600",
            "filename": "./jubilee-cloud-foundation-key.pem",
            "id": "031310b1a731a4f270ad46ff12f370704b034834",
            "sensitive_content": null,
            "source": null
          },
          "sensitive_attributes": [
            [
              {
                "type": "get_attr",
                "value": "content"
              }
            ],
            [
              {
                "type": "get_attr",
                "value": "sensitive_content"
              }
            ]
          ],
          "identity_schema_version": 0,
          "dependencies": [
            "tls_private_key.ssh"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "tls_private_key",
      "name": "ssh",
      "provider": "provider[\"registry.terraform.io/hashicorp/tls\"]",
      "instances": [
        {
          "index_key": 0,
          "schema_version": 1,
          "attributes": {
            "algorithm": "RSA",
            "ecdsa_curve": "P224",
            "id": "e2cd5fe6dbb7c879f25a5e5736a309ead34efa3d",
            "private_key_openssh": "-----BEGIN OPENSSH PRIVATE KEY-----\n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\n-----END OPENSSH PRIVATE KEY-----\n",
            "private_key_pem": "-----BEGIN RSA PRIVATE KEY-----\n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\n-----END RSA PRIVATE KEY-----\n",
            "private_key_pem_pkcs8": "-----BEGIN PRIVATE KEY-----\nMIIJRAIBADANBgkqhkiG9w0BAQEFAASCCS4wggkqAgEAAoICAQDif3eSVOcUEALG\n/wd6mPpY/qa3m9a2Fs9Iby9+iAMCWdK7HdxhfTROYDspbzlYwy2DjadTlJDPflKW\n2HdWTZbY5ZHIJSxzqJSJVMrSOqVQmmGLWJwOP0aA3uB2HCcqUatE2SdeRSQ9B9nD\noZ8GWgDv7sCWJS0R10pSt/Cmk0BIPm0cs6oJ5hIThnMtSGGBs7PfiAQShhsSNZVG\nA6/mtpAWwRIK6HyMuqK5naoKB+1qLW2fii4ADsecQk7Kzn2XLnqTNq1ZiciF7kEq\n6jGeQba1F8HcbcX9pLcxgK/knytESgelaHjbQgh2trtioHxDPf+chQav5O23mvQ1\nKybNq/GKndnGS11XpAbWjU1sXlskKVyMpxKqQTu6hbvsSJQZqlSH4OWVt3trm5Ty\nf9AqUeEJQQfYR26jx7cUtyUHazbytkqwvMjm3MBQ9NYMFX+3LSUXCCwp3ZuDKHEz\nT+sqf9YjKRT79TF7sOxZPXkbxRrcWaPKaysS4rF+iM57UZ883Bp502n1T9Lnw5GT\nDyhQG7PASwLHpyMI0bpFczJQ4CiyErEnERig05viUVyq00Yy6JjpNhs65CwPm9tq\n/zg5fLiq2CQUaOvCsEtNMOCb2t43Ed4yPap1xG4fo1GCpXk/7tWB0XzwK8C5xpp5\nctVOMmSBbjG10Z0EfKLRyeyiydNKBwIDAQABAoICACQUui+NZuJDSq34onBdPkQ/\nDL/jC2kmaQ7Y52/4qsINHQzBzQGauGJj4gjPtwr0zKNQRX+DAy6KqQ1unlQZOBaF\nO5vukA48pKzb3RNwVDVq4m8YRoPegJS27HrkMTkEmYv2K9dQnF08iuwnKvYQEGYo\nWnWQpoVZDnXu518hxfO8PhV8aXH6PJbvrBlilmXbAqRxPnTU+CsGbikhHTxbiMiX\nKRCjyHOCp7l57ER8zs1DP1tS39ESianSxkp4anlS5iPdafABivgK5Ea51/2l6j0e\n87rxocCuJKC2J078LCBMyrsG0XncIw0GPwOPHTx4++crKc2LYnMFNDHkFeJdqbRm\ne/Gg7ENSvjDIFtSPIxvpwedDeso1XRa/XYLMJgdaypK6cm6+7ZQ0LcxgNK4h63uV\nCqU10m0Qs1cslmBAvuxSpFf9hBMGeM0axIxUMUeWslqVJMAMU6p8KaAcAydDDrxn\n6qh6oAs34fZa5qCoibpx+OXdzwGsF/Zk01FnqVR/jls1xg8aZZv8sldtDlC6GItx\nGEhkSUNhpuLonF27KOyt+6mHlXuMbDivnF9moxh04dfb6e2f76ntCOr4CZdxr1tV\nH6bCR91oqak3RObCA/wAuatq+iwgcHTAzBwNNpLyd/9T/bt6ZESL0gdIeefjvrU1\nAzS9Lj4MvLOwzGgroQeBAoIBAQDoNatIrTWMN+NWHinZr5+j0fxnRF7vtXlkSWe9\n/n1aGxAg94FR0gceI6OUGr5rL/f4VsD6h9dHbGBZEyqRR1Ot9SKrv0EUn7QX22L3\nO0AOU7FqRIeNTANwMFiuTL9dQVAp00n7glPT0vftf8hSKa1XbZ5O8dEEarGrPTC4\nMGDkKBqHS+kAKonTKzJ0ykviJicpOhiFhKwXtRk3m85HEfpZdXCjFmcaxQew3QVu\n5jqtdK+wJg4JtqyxHFYLwG6bjMBDR45GMXoI40yed8ShKulGqEXNfQcW12ijE+jf\n+OSLUzf5nyA4pEyUJPY3ftqFyC4CZA+LKHBwdAQLoAVaioSPAoIBAQD5s/4N69xI\nB1w1O4ElVxci7AjCy8z7bHSdIBLrRngAiGNr1+IlBCRMvmORP8LWkPUF13wenVxp\nhrw3SdklSPMmhx79Ujd4+kWtRQfZeI2uK2gt6K8Jy4GvhWiE5fCS1sAAdOKxFskd\ntS5irxZDzZqdTIobUcqFkXq/53Pq+NwkmmvAN9KgXRPtTVzj/GEAog9hpL+xkNWw\n8NsIA2yjhMWtpqLt71EE9VS++hRZhj6n9WuZ7E9VU5mIZW7F2FH1mjx4WAPVFCL6\nBBs6YEH3uHPuYcOFbDpu5gkqMxW3tIitlqVbLOGaDoZN9SRrwx7KdnElwtE6Bg5i\nO72FzOKua88JAoIBAQDUZlL4NUcnrO9LFGgfcB9Lz4VaSBW2mX4iF2rHRQMP6nVE\nUmB9oOlVzi+QBy5qCQR+qYv3HU3zTNSMZZWoMV//XJyMEHLNFI+8yrWpgw7CjBda\nJrj+q6rxcaeMNzNLb7SNrXCcl8dpmC2jliB71xdxQxltCI+xxI4jHeN0dvwJdg1d\n+Dd2KXLML1UFswzaHR/w++z2JDbtsH8SeHekVnNyZJPU+Wbx+4tfYavYlsrRYkxZ\niVWJ2Qf5MPwb37bMnWA3qjofRp5jhtXMlazL5t5d/QlsPpK/d+WEVW/LfnQ+ZK5s\nq/rjFJXfZDe651Omz0YWdcQp+6FtmxEgOQzslotNAoIBAQCEyT3J42ph92AGgt07\noSORk5lZFY2tClC9GchVy0SXa/AK8mO1MY2oLfq+y/xto+pYr+22ThJNn7PJZwEN\nfcyn6WUGa0lKkTSqXrI86InXXAfrmfgzKkCNuVEKk0iqnX6+/2lpqOdMYAQJwHgD\nmHunOIOc4ZLkEqgHEysmgi53XJL+RfFBDB5DrEdAif5/mq65SyYRZCbvEDY5/bAx\nCLMilCHCi+g2zcvCPzTBIs2A/da5pNvPUUStLtuIZG+5Psr3aD6peirbb4GXOob6\nF+G2m9CgzBwKy1OGWGItLdkdDqZiZOyXwy+Sl1FF6R4fpnqnDQG8bGoLvR8c3waQ\noI4ZAoIBAQCdztPC816SImJNqZn7LugJdLH9BaK5H6KpyHdUZ8A1NtkOBCAP+bVj\nkb91dbaJA85z64glFrPN7ThLRUZnSsJxRtPRfQ3oyDjFILxIoMtOs3dbMnw0tk0H\nu6v8l46d/6cgfdoDO2wcrMWxwDZEezKSZQ5CHUdzfEm71pkxTIQhVhyZ1RQn4YtX\nprsDQRxeT15zeVYW6bidqBuaec+1FuQhgToS7YcQjBL/W9zo30Kq0Nahs53Ew2IX\noCRqiZLd7lXgYqIDdPRNC6Jw9R7K/GdXFHtgb36x5oZnJ/xw8/Z6L+1q0JtYcGZa\nWv1HdYhzePteTqW/nSn3ujg+I9ThvrKg\n-----END PRIVATE KEY-----\n",
            "public_key_fingerprint_md5": "30:07:8d:7f:aa:cb:37:cb:fa:4f:66:15:25:1a:09:60",
            "public_key_fingerprint_sha256": "SHA256:8J8PMJwDIA6mMPIKnraVeZxEDVL/YdDlJIh9TttjN24",
            "public_key_openssh": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDif3eSVOcUEALG/wd6mPpY/qa3m9a2Fs9Iby9+iAMCWdK7HdxhfTROYDspbzlYwy2DjadTlJDPflKW2HdWTZbY5ZHIJSxzqJSJVMrSOqVQmmGLWJwOP0aA3uB2HCcqUatE2SdeRSQ9B9nDoZ8GWgDv7sCWJS0R10pSt/Cmk0BIPm0cs6oJ5hIThnMtSGGBs7PfiAQShhsSNZVGA6/mtpAWwRIK6HyMuqK5naoKB+1qLW2fii4ADsecQk7Kzn2XLnqTNq1ZiciF7kEq6jGeQba1F8HcbcX9pLcxgK/knytESgelaHjbQgh2trtioHxDPf+chQav5O23mvQ1KybNq/GKndnGS11XpAbWjU1sXlskKVyMpxKqQTu6hbvsSJQZqlSH4OWVt3trm5Tyf9AqUeEJQQfYR26jx7cUtyUHazbytkqwvMjm3MBQ9NYMFX+3LSUXCCwp3ZuDKHEzT+sqf9YjKRT79TF7sOxZPXkbxRrcWaPKaysS4rF+iM57UZ883Bp502n1T9Lnw5GTDyhQG7PASwLHpyMI0bpFczJQ4CiyErEnERig05viUVyq00Yy6JjpNhs65CwPm9tq/zg5fLiq2CQUaOvCsEtNMOCb2t43Ed4yPap1xG4fo1GCpXk/7tWB0XzwK8C5xpp5ctVOMmSBbjG10Z0EfKLRyeyiydNKBw==\n",
            "public_key_pem": "-----BEGIN PUBLIC KEY-----\nMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA4n93klTnFBACxv8Hepj6\nWP6mt5vWthbPSG8vfogDAlnSux3cYX00TmA7KW85WMMtg42nU5SQz35Slth3Vk2W\n2OWRyCUsc6iUiVTK0jqlUJphi1icDj9GgN7gdhwnKlGrRNknXkUkPQfZw6GfBloA\n7+7AliUtEddKUrfwppNASD5tHLOqCeYSE4ZzLUhhgbOz34gEEoYbEjWVRgOv5raQ\nFsESCuh8jLqiuZ2qCgftai1tn4ouAA7HnEJOys59ly56kzatWYnIhe5BKuoxnkG2\ntRfB3G3F/aS3MYCv5J8rREoHpWh420IIdra7YqB8Qz3/nIUGr+Ttt5r0NSsmzavx\nip3ZxktdV6QG1o1NbF5bJClcjKcSqkE7uoW77EiUGapUh+Dllbd7a5uU8n/QKlHh\nCUEH2Eduo8e3FLclB2s28rZKsLzI5tzAUPTWDBV/ty0lFwgsKd2bgyhxM0/rKn/W\nIykU+/Uxe7DsWT15G8Ua3FmjymsrEuKxfojOe1GfPNwaedNp9U/S58ORkw8oUBuz\nwEsCx6cjCNG6RXMyUOAoshKxJxEYoNOb4lFcqtNGMuiY6TYbOuQsD5vbav84OXy4\nqtgkFGjrwrBLTTDgm9reNxHeMj2qdcRuH6NRgqV5P+7VgdF88CvAucaaeXLVTjJk\ngW4xtdGdBHyi0cnsosnTSgcCAwEAAQ==\n-----END PUBLIC KEY-----\n",
            "rsa_bits": 4096
          },
          "sensitive_attributes": [
            [
              {
                "type": "get_attr",
                "value": "private_key_openssh"
              }
            ],
            [
              {
                "type": "get_attr",
                "value": "private_key_pem"
              }
            ],
            [
              {
                "type": "get_attr",
                "value": "private_key_pem_pkcs8"
              }
            ]
          ],
          "identity_schema_version": 0
        }
      ]
    }
  ],
  "check_results": [
    {
      "object_kind": "var",
      "config_addr": "var.my_ip",
      "status": "pass",
      "objects": [
        {
          "object_addr": "var.my_ip",
          "status": "pass"
        }
      ]
    }
  ]
}

```


<div style='page-break-after: always;'></div>

# File: terraform.tfvars

```tfvars
aws_region = "us-east-1"

project = "jubilee-cloud-foundation"

environment = "dev"

vpc_cidr = "10.0.0.0/16"

public_subnet_cidr = "10.0.1.0/24"

private_subnet_cidr = "10.0.2.0/24"

instance_type = "t2.micro"

# Replace this with your real public IP.
# Example:
# my_ip = "197.232.10.55/32"
my_ip = "41.139.243.97/32"

create_key_pair   = true
existing_key_name = ""
create_iam_users  = true

# Set this to true only if your AWS account does not already have a password policy.
manage_password_policy = false

# Cost governance
create_budget        = true
monthly_budget_limit = "5"
billing_alert_emails = [
  "ahoosoftwares@gmail.com",
  "ahootech@outlook.com",
  "harryoduwor@gmail.com"
]
```


<div style='page-break-after: always;'></div>

# File: variables.tf

```tf
variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

variable "project" {
  description = "Project name used for naming resources"
  type        = string
  default     = "jubilee-cloud-foundation"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "instance_type" {
  description = "EC2 instance type. Use a small/free-tier eligible type."
  type        = string
  default     = "t2.micro"
}

variable "my_ip" {
  description = "Your public IP address in CIDR format, example: 197.232.10.55/32"
  type        = string

  validation {
    condition     = can(cidrhost(var.my_ip, 0))
    error_message = "The my_ip value must be a valid CIDR block, for example: 197.232.10.55/32"
  }
}

variable "create_key_pair" {
  description = "Set to true to generate a new SSH key pair using Terraform"
  type        = bool
  default     = true
}

variable "existing_key_name" {
  description = "Optional existing AWS EC2 key pair name. If set, Terraform will not create a new key."
  type        = string
  default     = ""
}

variable "create_iam_users" {
  description = "Set to true to create IAM users, login profiles, and group memberships"
  type        = bool
  default     = true
}

variable "manage_password_policy" {
  description = "Set to true only if your AWS account does not already have an IAM password policy."
  type        = bool
  default     = true
}

variable "create_budget" {
  description = "Set to true to create an AWS Budget for cost governance"
  type        = bool
  default     = true
}

variable "monthly_budget_limit" {
  description = "Monthly budget limit in USD"
  type        = string
  default     = "5"
}

variable "billing_alert_emails" {
  description = "List of email addresses to receive budget alerts."
  type        = list(string)
  default     = []
}
```


<div style='page-break-after: always;'></div>

# File: web_user_data.sh

```sh
#!/bin/bash

# Create web folder
mkdir -p /var/www/web

# Create simple web page
cat > /var/www/web/index.html <<'HTML'
<html>
  <body>
    <h1>Jubilee Cloud Foundation</h1>
    <p>This web server is running in a private subnet.</p>
    <p>Only approved internal traffic can reach it.</p>
  </body>
</html>
HTML

# Create systemd service
cat > /etc/systemd/system/simple-web.service <<'UNIT'
[Unit]
Description=Simple Python Web Server
After=network.target

[Service]
ExecStart=/usr/bin/python3 -m http.server 80 --directory /var/www/web
Restart=always
User=root

[Install]
WantedBy=multi-user.target
UNIT

# Enable and start service
systemctl daemon-reload
systemctl enable --now simple-web.service
```

