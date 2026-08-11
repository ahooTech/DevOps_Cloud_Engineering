# Staff Canteen Management System

Generated: 08/10/2026 23:02:25

---

## Table of Contents

- .terraform.lock.hcl
- .terraform\providers\registry.terraform.io\hashicorp\aws\5.100.0\windows_amd64\LICENSE.txt
- .terraform\providers\registry.terraform.io\hashicorp\local\2.9.0\windows_amd64\LICENSE.txt
- .terraform\providers\registry.terraform.io\hashicorp\random\3.9.0\windows_amd64\LICENSE.txt
- .terraform\providers\registry.terraform.io\hashicorp\tls\4.3.0\windows_amd64\LICENSE.txt
- main.tf
- outputs.tf
- run.md
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

locals {
  create_new_key = var.create_key_pair && var.existing_key_name == ""
  ssh_key_name = var.existing_key_name != "" ? var.existing_key_name : (
    local.create_new_key ? aws_key_pair.ssh[0].key_name : null
  )
  web_user_data = file("${path.module}/web_user_data.sh")
  iam_users = var.create_iam_users ? {
    "admin.lab"    = [aws_iam_group.admins.name]
    "engineer.lab" = [aws_iam_group.engineers.name]
    "auditor.lab"  = [aws_iam_group.auditors.name]
  } : {}
}

# --- SSH Key Pair ---
resource "tls_private_key" "ssh" {
  count     = local.create_new_key ? 1 : 0
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ssh" {
  count      = local.create_new_key ? 1 : 0
  key_name   = "${var.project}-key"
  public_key = tls_private_key.ssh[0].public_key_openssh
  tags       = { Name = "${var.project}-key" }
}

resource "local_file" "ssh_private_key" {
  count           = local.create_new_key ? 1 : 0
  filename        = "${path.module}/${var.project}-key.pem"
  content         = tls_private_key.ssh[0].private_key_pem
  file_permission = "0600"
}

# --- VPC & Multi-AZ Networking ---
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = { Name = "${var.project}-vpc" }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "${var.project}-igw" }
}

resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags                    = { Name = "public-subnet-a" }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_b_cidr
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true
  tags                    = { Name = "public-subnet-b" }
}

resource "aws_subnet" "private_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_cidr
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = false
  tags                    = { Name = "private-subnet-a" }
}

resource "aws_subnet" "private_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_b_cidr
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = false
  tags                    = { Name = "private-subnet-b" }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = { Name = "public-rt" }
}

resource "aws_route_table_association" "public_a" {
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_b" {
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags   = { Name = "private-rt" }
}

resource "aws_route_table_association" "private_a" {
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_b" {
  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.private.id
}

# --- Security Groups ---
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
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "bastion-sg" }
}

resource "aws_security_group" "alb" {
  name        = "${var.project}-alb-sg"
  description = "Allow HTTP from internet"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTP from internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "alb-sg" }
}

resource "aws_security_group" "web" {
  name        = "${var.project}-web-sg"
  description = "Allow HTTP from ALB and SSH from Bastion"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "HTTP from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  ingress {
    description     = "SSH from Bastion"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion.id]
  }

  egress {
    description = "Allow outbound within VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_cidr]
  }

  tags = { Name = "web-sg" }
}

# --- Bastion Host ---
resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.amazon_linux_2023.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public_a.id
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

  tags = { Name = "bastion" }

  depends_on = [aws_internet_gateway.main]
}

# --- LEVEL 2: ALB, Launch Template & ASG ---
resource "aws_lb" "main" {
  name               = "${var.project}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = [aws_subnet.public_a.id, aws_subnet.public_b.id]
  tags               = { Name = "${var.project}-alb" }
}

resource "aws_lb_target_group" "web" {
  name     = "${var.project}-tg" # Shortened to avoid AWS 32-character limit
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = { Name = "${var.project}-web-tg" }
}

resource "aws_lb_listener" "web" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web.arn
  }
}

resource "aws_launch_template" "web" {
  name_prefix            = "${var.project}-web-"
  image_id               = data.aws_ami.amazon_linux_2023.id
  instance_type          = var.instance_type
  key_name               = local.ssh_key_name
  vpc_security_group_ids = [aws_security_group.web.id]
  user_data              = base64encode(local.web_user_data)

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      volume_size           = 8
      volume_type           = "gp3"
      encrypted             = true
      delete_on_termination = true
    }
  }

  tag_specifications {
    resource_type = "instance"
    tags          = { Name = "${var.project}-web-asg-instance" }
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "web" {
  name                      = "${var.project}-web-asg"
  min_size                  = 1
  max_size                  = 3    # Maximum vm's creted by the ASG
  desired_capacity          = 1
  vpc_zone_identifier       = [aws_subnet.private_a.id, aws_subnet.private_b.id]
  target_group_arns         = [aws_lb_target_group.web.arn]
  health_check_type         = "ELB"
  health_check_grace_period = 120

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.project}-web-asg-instance"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "web_cpu_policy" {
  name                   = "${var.project}-web-cpu-policy"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.web.name

  estimated_instance_warmup = 300

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 60.0
  }
}

# --- IAM & Budgets (Unchanged from Level 1) ---
resource "aws_iam_account_password_policy" "strict" {
  count                          = var.manage_password_policy ? 1 : 0
  minimum_password_length        = 14
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
  password_reuse_prevention      = 24
  max_password_age               = 90
}

resource "aws_iam_group" "admins" {
  name = "Admins"
}

resource "aws_iam_group" "engineers" {
  name = "CloudEngineers"
}

resource "aws_iam_group" "auditors" {
  name = "Auditors"
}

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

resource "aws_iam_user" "this" {
  for_each = local.iam_users
  name     = each.key
}

resource "aws_iam_user_group_membership" "this" {
  for_each = local.iam_users
  user     = aws_iam_user.this[each.key].name
  groups   = each.value
}

resource "aws_iam_user_login_profile" "this" {
  for_each                = local.iam_users
  user                    = aws_iam_user.this[each.key].name
  password_length         = 16
  password_reset_required = true
}

resource "aws_budgets_budget" "learning" {
  count        = var.create_budget && var.billing_alert_emails != "" ? 1 : 0
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
    subscriber_email_addresses = var.billing_alert_emails
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

output "bastion_public_dns" {
  description = "Public DNS name of the bastion server"
  value       = aws_instance.bastion.public_dns
}

output "ssh_command" {
  description = "SSH command to connect to the bastion server"
  value       = local.create_new_key ? "ssh -i ${local_file.ssh_private_key[0].filename} ec2-user@${aws_instance.bastion.public_dns}" : "ssh ec2-user@${aws_instance.bastion.public_dns}"
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.main.dns_name
}

output "curl_command" {
  description = "Command to test the load balancer"
  value       = "curl http://${aws_lb.main.dns_name}"
}

output "iam_user_passwords" {
  description = "Generated IAM console passwords. Use: terraform output -json iam_user_passwords"
  value       = { for username, profile in aws_iam_user_login_profile.this : username => profile.password }
  sensitive   = true
}
```


<div style='page-break-after: always;'></div>

# File: run.md

```md
# Fix SSH Key Permissions on Windows

icacls .\jubilee-cloud-foundation-key.pem /inheritance:r
icacls .\jubilee-cloud-foundation-key.pem /grant:r "${env:USERNAME}:(R)"
```


<div style='page-break-after: always;'></div>

# File: terraform.tfstate

```tfstate
{
  "version": 4,
  "terraform_version": "1.15.2",
  "serial": 640,
  "lineage": "c262993e-deb9-fb61-5918-5aa8e1363739",
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
  "serial": 593,
  "lineage": "c262993e-deb9-fb61-5918-5aa8e1363739",
  "outputs": {
    "alb_dns_name": {
      "value": "jubilee-cloud-foundation-alb-1972826552.us-east-1.elb.amazonaws.com",
      "type": "string"
    },
    "bastion_public_dns": {
      "value": "ec2-35-175-109-41.compute-1.amazonaws.com",
      "type": "string"
    },
    "curl_command": {
      "value": "curl http://jubilee-cloud-foundation-alb-1972826552.us-east-1.elb.amazonaws.com",
      "type": "string"
    },
    "iam_user_passwords": {
      "value": {
        "admin.lab": "x_'AyO'8K5^O**|b",
        "auditor.lab": "{=JqT$a%OYI*BuF0",
        "engineer.lab": "XFPN7++NK]DZa55i"
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
    "ssh_command": {
      "value": "ssh -i ./jubilee-cloud-foundation-key.pem ec2-user@ec2-35-175-109-41.compute-1.amazonaws.com",
      "type": "string"
    },
    "vpc_id": {
      "value": "vpc-08f20136e1c09b684",
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
      "type": "aws_autoscaling_group",
      "name": "web",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:autoscaling:us-east-1:932453198323:autoScalingGroup:0757efe0-f1f3-461a-a533-c705214e2f3d:autoScalingGroupName/jubilee-cloud-foundation-web-asg",
            "availability_zone_distribution": [
              {
                "capacity_distribution_strategy": "balanced-best-effort"
              }
            ],
            "availability_zones": [
              "us-east-1a",
              "us-east-1b"
            ],
            "capacity_rebalance": false,
            "capacity_reservation_specification": [
              {
                "capacity_reservation_preference": "default",
                "capacity_reservation_target": []
              }
            ],
            "context": "",
            "default_cooldown": 300,
            "default_instance_warmup": 0,
            "desired_capacity": 1,
            "desired_capacity_type": "",
            "enabled_metrics": null,
            "force_delete": false,
            "force_delete_warm_pool": false,
            "health_check_grace_period": 120,
            "health_check_type": "ELB",
            "id": "jubilee-cloud-foundation-web-asg",
            "ignore_failed_scaling_activities": false,
            "initial_lifecycle_hook": [],
            "instance_maintenance_policy": [],
            "instance_refresh": [],
            "launch_configuration": "",
            "launch_template": [
              {
                "id": "lt-068ef929c50f1defa",
                "name": "jubilee-cloud-foundation-web-2026081018532114100000000c",
                "version": "$Latest"
              }
            ],
            "load_balancers": [],
            "max_instance_lifetime": 0,
            "max_size": 3,
            "metrics_granularity": "1Minute",
            "min_elb_capacity": null,
            "min_size": 1,
            "mixed_instances_policy": [],
            "name": "jubilee-cloud-foundation-web-asg",
            "name_prefix": "",
            "placement_group": "",
            "predicted_capacity": 0,
            "protect_from_scale_in": false,
            "service_linked_role_arn": "arn:aws:iam::932453198323:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling",
            "suspended_processes": null,
            "tag": [
              {
                "key": "Name",
                "propagate_at_launch": true,
                "value": "jubilee-cloud-foundation-web-asg-instance"
              }
            ],
            "target_group_arns": [
              "arn:aws:elasticloadbalancing:us-east-1:932453198323:targetgroup/jubilee-cloud-foundation-tg/0fb37fa9da999ec7"
            ],
            "termination_policies": null,
            "timeouts": null,
            "traffic_source": [
              {
                "identifier": "arn:aws:elasticloadbalancing:us-east-1:932453198323:targetgroup/jubilee-cloud-foundation-tg/0fb37fa9da999ec7",
                "type": "elbv2"
              }
            ],
            "vpc_zone_identifier": [
              "subnet-07052247064b4c636",
              "subnet-0afa00c9e26f3fec4"
            ],
            "wait_for_capacity_timeout": "10m",
            "wait_for_elb_capacity": null,
            "warm_pool": [],
            "warm_pool_size": 0
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiZGVsZXRlIjo2MDAwMDAwMDAwMDAsInVwZGF0ZSI6NjAwMDAwMDAwMDAwfSwic2NoZW1hX3ZlcnNpb24iOiIxIn0=",
          "dependencies": [
            "aws_key_pair.ssh",
            "aws_launch_template.web",
            "aws_lb_target_group.web",
            "aws_security_group.alb",
            "aws_security_group.bastion",
            "aws_security_group.web",
            "aws_subnet.private_a",
            "aws_subnet.private_b",
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
      "type": "aws_autoscaling_policy",
      "name": "web_cpu_policy",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "adjustment_type": "",
            "arn": "arn:aws:autoscaling:us-east-1:932453198323:scalingPolicy:dc64bdc5-c103-496e-bb9a-80018c9767fb:autoScalingGroupName/jubilee-cloud-foundation-web-asg:policyName/jubilee-cloud-foundation-web-cpu-policy",
            "autoscaling_group_name": "jubilee-cloud-foundation-web-asg",
            "cooldown": 0,
            "enabled": true,
            "estimated_instance_warmup": 300,
            "id": "jubilee-cloud-foundation-web-cpu-policy",
            "metric_aggregation_type": "",
            "min_adjustment_magnitude": 0,
            "name": "jubilee-cloud-foundation-web-cpu-policy",
            "policy_type": "TargetTrackingScaling",
            "predictive_scaling_configuration": [],
            "scaling_adjustment": 0,
            "step_adjustment": [],
            "target_tracking_configuration": [
              {
                "customized_metric_specification": [],
                "disable_scale_in": false,
                "predefined_metric_specification": [
                  {
                    "predefined_metric_type": "ASGAverageCPUUtilization",
                    "resource_label": ""
                  }
                ],
                "target_value": 60
              }
            ]
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "aws_autoscaling_group.web",
            "aws_key_pair.ssh",
            "aws_launch_template.web",
            "aws_lb_target_group.web",
            "aws_security_group.alb",
            "aws_security_group.bastion",
            "aws_security_group.web",
            "aws_subnet.private_a",
            "aws_subnet.private_b",
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
            "unique_id": "AGPA5SGUKVHZVLKO6CY73"
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
            "unique_id": "AGPA5SGUKVHZYAVRAT3O5"
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
            "unique_id": "AGPA5SGUKVHZSH7VASXFZ"
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
            "id": "Admins-20260810185254959600000001",
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
            "id": "Auditors-20260810185255212600000003",
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
            "id": "Auditors-20260810185255182500000002",
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
            "id": "CloudEngineers-20260810185255306700000005",
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
            "id": "CloudEngineers-20260810185255504600000006",
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
            "id": "CloudEngineers-20260810185255295000000004",
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
            "unique_id": "AIDA5SGUKVHZSCX7T4QVQ"
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
            "unique_id": "AIDA5SGUKVHZ7FPXJB2G3"
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
            "unique_id": "AIDA5SGUKVHZSOUBC2NAN"
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
            "id": "terraform-20260810185256348300000007",
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
            "id": "terraform-20260810185256363000000008",
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
            "id": "terraform-20260810185256369100000009",
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
            "password": "x_'AyO'8K5^O**|b",
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
            "password": "{=JqT$a%OYI*BuF0",
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
            "password": "XFPN7++NK]DZa55i",
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
            "arn": "arn:aws:ec2:us-east-1:932453198323:instance/i-0e9170dee8617327c",
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
            "id": "i-0e9170dee8617327c",
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
            "primary_network_interface_id": "eni-02ba4c9798e7acdc7",
            "private_dns": "ip-10-0-1-4.ec2.internal",
            "private_dns_name_options": [
              {
                "enable_resource_name_dns_a_record": false,
                "enable_resource_name_dns_aaaa_record": false,
                "hostname_type": "ip-name"
              }
            ],
            "private_ip": "10.0.1.4",
            "public_dns": "ec2-35-175-109-41.compute-1.amazonaws.com",
            "public_ip": "35.175.109.41",
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
                "volume_id": "vol-0a87143c96197e322",
                "volume_size": 8,
                "volume_type": "gp3"
              }
            ],
            "secondary_private_ips": [],
            "security_groups": [],
            "source_dest_check": true,
            "spot_instance_request_id": "",
            "subnet_id": "subnet-049b22ba8977d11a1",
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
              "sg-0862e4861bec659ba"
            ]
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMCwicmVhZCI6OTAwMDAwMDAwMDAwLCJ1cGRhdGUiOjYwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9",
          "dependencies": [
            "aws_internet_gateway.main",
            "aws_key_pair.ssh",
            "aws_security_group.bastion",
            "aws_subnet.public_a",
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
            "arn": "arn:aws:ec2:us-east-1:932453198323:internet-gateway/igw-0a28b8fa3b69da5d7",
            "id": "igw-0a28b8fa3b69da5d7",
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
            "vpc_id": "vpc-08f20136e1c09b684"
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
            "fingerprint": "4c:b3:6e:fc:2e:35:c8:07:00:c6:5a:14:a3:98:57:71",
            "id": "jubilee-cloud-foundation-key",
            "key_name": "jubilee-cloud-foundation-key",
            "key_name_prefix": "",
            "key_pair_id": "key-07b05edd1dfb72878",
            "key_type": "rsa",
            "public_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDgi1VeYBx5OsJPV7Hdvts3aOSfiEnp6/UEVnM2P6YzZoQBvkKw4+NUiSdWTBNl3RMjvu+GOLMyygUm0MuWjiz8pNOeFmtg+GVV1UKSuWhUOwps0z+tiBnrVfz/LiRhaVwALGDWpOlOT36HKpdYm3QV/3vOadB6UOrErEd4jNwJWDO6KH6dalmasnLWhM47VuAXDDMoK5TVX7NqpMyT2euIcow04p+e2poT4psa0rz+RDf5l8gO5vJigc892cf+67eQJDXYvZLJtb9tTyWVKZ0+dZWwMD/wFsYa7kGTps3lnQn2PL1bjmqJXmqTPn3XNXYchbGvpKFOk+iy1A3O3KSdkr8iW6BJeYXU8Nv5+S1wH7sGx2lbgYbBH9F+LQhCRdX5KGlyeywUcWZSiSAV/xELWtWoTC/yfTR42Z+9bEcwCLTgfLbhfvGP04IU+LRR7ANsCHLhxew1pL6LZ17IaoUjLOjRDWFeu39/SIMuxcalRiVZmW93hon0JUp7Uq3rJ0SjQmfX6Jn2LLy7HYHoifaH6Xhyab6uwh9Gy10PsoQQNFGtii+FejOjxVw3dAlsC0urBPclqaCVgI5L48ue6McyScyBS/UDaiTTam36WLlFQJ4PIbGgXeSJjKONHxYQ1Pf91547aWf6gEVH8bIY+vXg6WoYXfEBX5eJFSH5uyxUDw==",
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
          ],
          "create_before_destroy": true
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_launch_template",
      "name": "web",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:932453198323:launch-template/lt-068ef929c50f1defa",
            "block_device_mappings": [
              {
                "device_name": "/dev/xvda",
                "ebs": [
                  {
                    "delete_on_termination": "true",
                    "encrypted": "true",
                    "iops": 0,
                    "kms_key_id": "",
                    "snapshot_id": "",
                    "throughput": 0,
                    "volume_initialization_rate": 0,
                    "volume_size": 8,
                    "volume_type": "gp3"
                  }
                ],
                "no_device": "",
                "virtual_name": ""
              }
            ],
            "capacity_reservation_specification": [],
            "cpu_options": [],
            "credit_specification": [],
            "default_version": 1,
            "description": "",
            "disable_api_stop": false,
            "disable_api_termination": false,
            "ebs_optimized": "",
            "elastic_gpu_specifications": [],
            "elastic_inference_accelerator": [],
            "enclave_options": [],
            "hibernation_options": [],
            "iam_instance_profile": [],
            "id": "lt-068ef929c50f1defa",
            "image_id": "ami-07a5b367e8dc8bd92",
            "instance_initiated_shutdown_behavior": "",
            "instance_market_options": [],
            "instance_requirements": [],
            "instance_type": "t2.micro",
            "kernel_id": "",
            "key_name": "jubilee-cloud-foundation-key",
            "latest_version": 1,
            "license_specification": [],
            "maintenance_options": [],
            "metadata_options": [
              {
                "http_endpoint": "enabled",
                "http_protocol_ipv6": "",
                "http_put_response_hop_limit": 1,
                "http_tokens": "required",
                "instance_metadata_tags": ""
              }
            ],
            "monitoring": [],
            "name": "jubilee-cloud-foundation-web-2026081018532114100000000c",
            "name_prefix": "jubilee-cloud-foundation-web-",
            "network_interfaces": [],
            "placement": [],
            "private_dns_name_options": [],
            "ram_disk_id": "",
            "security_group_names": null,
            "tag_specifications": [
              {
                "resource_type": "instance",
                "tags": {
                  "Name": "jubilee-cloud-foundation-web-asg-instance"
                }
              }
            ],
            "tags": null,
            "tags_all": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Project": "jubilee-cloud-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "update_default_version": null,
            "user_data": "IyEvYmluL2Jhc2gKIyBDcmVhdGUgd2ViIGZvbGRlcgpta2RpciAtcCAvdmFyL3d3dy93ZWIKCiMgQ3JlYXRlIHNpbXBsZSB3ZWIgcGFnZSAoTm90aWNlICdIVE1MJyBpcyB1bnF1b3RlZCBzbyAkKGhvc3RuYW1lKSBleHBhbmRzISkKY2F0ID4gL3Zhci93d3cvd2ViL2luZGV4Lmh0bWwgPDxIVE1MCjxodG1sPgogIDxib2R5PgogICAgPGgxPkp1YmlsZWUgQ2xvdWQgRm91bmRhdGlvbjwvaDE+CiAgICA8cD5UaGlzIHdlYiBzZXJ2ZXIgaXMgcnVubmluZyBpbiBhIHByaXZhdGUgc3VibmV0LjwvcD4KICAgIDxwPjxzdHJvbmc+U2VydmVkIGJ5OiAkKGhvc3RuYW1lKTwvc3Ryb25nPjwvcD4KICA8L2JvZHk+CjwvaHRtbD4KSFRNTAoKIyBDcmVhdGUgc3lzdGVtZCBzZXJ2aWNlCmNhdCA+IC9ldGMvc3lzdGVtZC9zeXN0ZW0vc2ltcGxlLXdlYi5zZXJ2aWNlIDw8J1VOSVQnCltVbml0XQpEZXNjcmlwdGlvbj1TaW1wbGUgUHl0aG9uIFdlYiBTZXJ2ZXIKQWZ0ZXI9bmV0d29yay50YXJnZXQKCltTZXJ2aWNlXQpFeGVjU3RhcnQ9L3Vzci9iaW4vcHl0aG9uMyAtbSBodHRwLnNlcnZlciA4MCAtLWRpcmVjdG9yeSAvdmFyL3d3dy93ZWIKUmVzdGFydD1hbHdheXMKVXNlcj1yb290CgpbSW5zdGFsbF0KV2FudGVkQnk9bXVsdGktdXNlci50YXJnZXQKVU5JVAoKIyBFbmFibGUgYW5kIHN0YXJ0IHNlcnZpY2UKc3lzdGVtY3RsIGRhZW1vbi1yZWxvYWQKc3lzdGVtY3RsIGVuYWJsZSAtLW5vdyBzaW1wbGUtd2ViLnNlcnZpY2U=",
            "vpc_security_group_ids": [
              "sg-0ffc0561dc1c50ec2"
            ]
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "aws_key_pair.ssh",
            "aws_security_group.alb",
            "aws_security_group.bastion",
            "aws_security_group.web",
            "aws_vpc.main",
            "data.aws_ami.amazon_linux_2023",
            "tls_private_key.ssh"
          ],
          "create_before_destroy": true
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_lb",
      "name": "main",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "access_logs": [
              {
                "bucket": "",
                "enabled": false,
                "prefix": ""
              }
            ],
            "arn": "arn:aws:elasticloadbalancing:us-east-1:932453198323:loadbalancer/app/jubilee-cloud-foundation-alb/aa669770644281a9",
            "arn_suffix": "app/jubilee-cloud-foundation-alb/aa669770644281a9",
            "client_keep_alive": 3600,
            "connection_logs": [
              {
                "bucket": "",
                "enabled": false,
                "prefix": ""
              }
            ],
            "customer_owned_ipv4_pool": "",
            "desync_mitigation_mode": "defensive",
            "dns_name": "jubilee-cloud-foundation-alb-1972826552.us-east-1.elb.amazonaws.com",
            "dns_record_client_routing_policy": null,
            "drop_invalid_header_fields": false,
            "enable_cross_zone_load_balancing": true,
            "enable_deletion_protection": false,
            "enable_http2": true,
            "enable_tls_version_and_cipher_suite_headers": false,
            "enable_waf_fail_open": false,
            "enable_xff_client_port": false,
            "enable_zonal_shift": false,
            "enforce_security_group_inbound_rules_on_private_link_traffic": "",
            "id": "arn:aws:elasticloadbalancing:us-east-1:932453198323:loadbalancer/app/jubilee-cloud-foundation-alb/aa669770644281a9",
            "idle_timeout": 60,
            "internal": false,
            "ip_address_type": "ipv4",
            "ipam_pools": [],
            "load_balancer_type": "application",
            "minimum_load_balancer_capacity": [],
            "name": "jubilee-cloud-foundation-alb",
            "name_prefix": "",
            "preserve_host_header": false,
            "security_groups": [
              "sg-0cf8142dce37abceb"
            ],
            "subnet_mapping": [
              {
                "allocation_id": "",
                "ipv6_address": "",
                "outpost_id": "",
                "private_ipv4_address": "",
                "subnet_id": "subnet-049b22ba8977d11a1"
              },
              {
                "allocation_id": "",
                "ipv6_address": "",
                "outpost_id": "",
                "private_ipv4_address": "",
                "subnet_id": "subnet-05cba28450e6eecfb"
              }
            ],
            "subnets": [
              "subnet-049b22ba8977d11a1",
              "subnet-05cba28450e6eecfb"
            ],
            "tags": {
              "Name": "jubilee-cloud-foundation-alb"
            },
            "tags_all": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Name": "jubilee-cloud-foundation-alb",
              "Project": "jubilee-cloud-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "timeouts": null,
            "vpc_id": "vpc-08f20136e1c09b684",
            "xff_header_processing_mode": "append",
            "zone_id": "Z35SXDOTRQ7X7K"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6NjAwMDAwMDAwMDAwLCJ1cGRhdGUiOjYwMDAwMDAwMDAwMH19",
          "dependencies": [
            "aws_security_group.alb",
            "aws_subnet.public_a",
            "aws_subnet.public_b",
            "aws_vpc.main",
            "data.aws_availability_zones.available"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_lb_listener",
      "name": "web",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "alpn_policy": null,
            "arn": "arn:aws:elasticloadbalancing:us-east-1:932453198323:listener/app/jubilee-cloud-foundation-alb/aa669770644281a9/c2efca5d9f4a5a5d",
            "certificate_arn": null,
            "default_action": [
              {
                "authenticate_cognito": [],
                "authenticate_oidc": [],
                "fixed_response": [],
                "forward": [],
                "order": 1,
                "redirect": [],
                "target_group_arn": "arn:aws:elasticloadbalancing:us-east-1:932453198323:targetgroup/jubilee-cloud-foundation-tg/0fb37fa9da999ec7",
                "type": "forward"
              }
            ],
            "id": "arn:aws:elasticloadbalancing:us-east-1:932453198323:listener/app/jubilee-cloud-foundation-alb/aa669770644281a9/c2efca5d9f4a5a5d",
            "load_balancer_arn": "arn:aws:elasticloadbalancing:us-east-1:932453198323:loadbalancer/app/jubilee-cloud-foundation-alb/aa669770644281a9",
            "mutual_authentication": [],
            "port": 80,
            "protocol": "HTTP",
            "routing_http_request_x_amzn_mtls_clientcert_header_name": null,
            "routing_http_request_x_amzn_mtls_clientcert_issuer_header_name": null,
            "routing_http_request_x_amzn_mtls_clientcert_leaf_header_name": null,
            "routing_http_request_x_amzn_mtls_clientcert_serial_number_header_name": null,
            "routing_http_request_x_amzn_mtls_clientcert_subject_header_name": null,
            "routing_http_request_x_amzn_mtls_clientcert_validity_header_name": null,
            "routing_http_request_x_amzn_tls_cipher_suite_header_name": null,
            "routing_http_request_x_amzn_tls_version_header_name": null,
            "routing_http_response_access_control_allow_credentials_header_value": "",
            "routing_http_response_access_control_allow_headers_header_value": "",
            "routing_http_response_access_control_allow_methods_header_value": "",
            "routing_http_response_access_control_allow_origin_header_value": "",
            "routing_http_response_access_control_expose_headers_header_value": "",
            "routing_http_response_access_control_max_age_header_value": "",
            "routing_http_response_content_security_policy_header_value": "",
            "routing_http_response_server_enabled": true,
            "routing_http_response_strict_transport_security_header_value": "",
            "routing_http_response_x_content_type_options_header_value": "",
            "routing_http_response_x_frame_options_header_value": "",
            "ssl_policy": "",
            "tags": null,
            "tags_all": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Project": "jubilee-cloud-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "tcp_idle_timeout_seconds": null,
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDAsInVwZGF0ZSI6MzAwMDAwMDAwMDAwfX0=",
          "dependencies": [
            "aws_lb.main",
            "aws_lb_target_group.web",
            "aws_security_group.alb",
            "aws_subnet.public_a",
            "aws_subnet.public_b",
            "aws_vpc.main",
            "data.aws_availability_zones.available"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_lb_target_group",
      "name": "web",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "arn": "arn:aws:elasticloadbalancing:us-east-1:932453198323:targetgroup/jubilee-cloud-foundation-tg/0fb37fa9da999ec7",
            "arn_suffix": "targetgroup/jubilee-cloud-foundation-tg/0fb37fa9da999ec7",
            "connection_termination": null,
            "deregistration_delay": "300",
            "health_check": [
              {
                "enabled": true,
                "healthy_threshold": 2,
                "interval": 15,
                "matcher": "200",
                "path": "/",
                "port": "traffic-port",
                "protocol": "HTTP",
                "timeout": 5,
                "unhealthy_threshold": 2
              }
            ],
            "id": "arn:aws:elasticloadbalancing:us-east-1:932453198323:targetgroup/jubilee-cloud-foundation-tg/0fb37fa9da999ec7",
            "ip_address_type": "ipv4",
            "lambda_multi_value_headers_enabled": false,
            "load_balancer_arns": [],
            "load_balancing_algorithm_type": "round_robin",
            "load_balancing_anomaly_mitigation": "off",
            "load_balancing_cross_zone_enabled": "use_load_balancer_configuration",
            "name": "jubilee-cloud-foundation-tg",
            "name_prefix": "",
            "port": 80,
            "preserve_client_ip": null,
            "protocol": "HTTP",
            "protocol_version": "HTTP1",
            "proxy_protocol_v2": false,
            "slow_start": 0,
            "stickiness": [
              {
                "cookie_duration": 86400,
                "cookie_name": "",
                "enabled": false,
                "type": "lb_cookie"
              }
            ],
            "tags": {
              "Name": "jubilee-cloud-foundation-web-tg"
            },
            "tags_all": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Name": "jubilee-cloud-foundation-web-tg",
              "Project": "jubilee-cloud-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "target_failover": [
              {
                "on_deregistration": null,
                "on_unhealthy": null
              }
            ],
            "target_group_health": [
              {
                "dns_failover": [
                  {
                    "minimum_healthy_targets_count": "1",
                    "minimum_healthy_targets_percentage": "off"
                  }
                ],
                "unhealthy_state_routing": [
                  {
                    "minimum_healthy_targets_count": 1,
                    "minimum_healthy_targets_percentage": "off"
                  }
                ]
              }
            ],
            "target_health_state": [
              {
                "enable_unhealthy_connection_termination": null,
                "unhealthy_draining_interval": null
              }
            ],
            "target_type": "instance",
            "vpc_id": "vpc-08f20136e1c09b684"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "aws_vpc.main"
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
            "arn": "arn:aws:ec2:us-east-1:932453198323:route-table/rtb-0b7549e3f6d730c18",
            "id": "rtb-0b7549e3f6d730c18",
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
            "vpc_id": "vpc-08f20136e1c09b684"
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
            "arn": "arn:aws:ec2:us-east-1:932453198323:route-table/rtb-0289caeae233ced69",
            "id": "rtb-0289caeae233ced69",
            "owner_id": "932453198323",
            "propagating_vgws": [],
            "route": [
              {
                "carrier_gateway_id": "",
                "cidr_block": "0.0.0.0/0",
                "core_network_arn": "",
                "destination_prefix_list_id": "",
                "egress_only_gateway_id": "",
                "gateway_id": "igw-0a28b8fa3b69da5d7",
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
            "vpc_id": "vpc-08f20136e1c09b684"
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
      "name": "private_a",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "gateway_id": "",
            "id": "rtbassoc-0622ab5c5aa6abdc3",
            "route_table_id": "rtb-0b7549e3f6d730c18",
            "subnet_id": "subnet-0afa00c9e26f3fec4",
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDAsImRlbGV0ZSI6MzAwMDAwMDAwMDAwLCJ1cGRhdGUiOjEyMDAwMDAwMDAwMH19",
          "dependencies": [
            "aws_route_table.private",
            "aws_subnet.private_a",
            "aws_vpc.main",
            "data.aws_availability_zones.available"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_route_table_association",
      "name": "private_b",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "gateway_id": "",
            "id": "rtbassoc-0a9d31104462c27f9",
            "route_table_id": "rtb-0b7549e3f6d730c18",
            "subnet_id": "subnet-07052247064b4c636",
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDAsImRlbGV0ZSI6MzAwMDAwMDAwMDAwLCJ1cGRhdGUiOjEyMDAwMDAwMDAwMH19",
          "dependencies": [
            "aws_route_table.private",
            "aws_subnet.private_b",
            "aws_vpc.main",
            "data.aws_availability_zones.available"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_route_table_association",
      "name": "public_a",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "gateway_id": "",
            "id": "rtbassoc-020958f31b476f158",
            "route_table_id": "rtb-0289caeae233ced69",
            "subnet_id": "subnet-049b22ba8977d11a1",
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDAsImRlbGV0ZSI6MzAwMDAwMDAwMDAwLCJ1cGRhdGUiOjEyMDAwMDAwMDAwMH19",
          "dependencies": [
            "aws_internet_gateway.main",
            "aws_route_table.public",
            "aws_subnet.public_a",
            "aws_vpc.main",
            "data.aws_availability_zones.available"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_route_table_association",
      "name": "public_b",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "gateway_id": "",
            "id": "rtbassoc-084676deb05eb03d9",
            "route_table_id": "rtb-0289caeae233ced69",
            "subnet_id": "subnet-05cba28450e6eecfb",
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDAsImRlbGV0ZSI6MzAwMDAwMDAwMDAwLCJ1cGRhdGUiOjEyMDAwMDAwMDAwMH19",
          "dependencies": [
            "aws_internet_gateway.main",
            "aws_route_table.public",
            "aws_subnet.public_b",
            "aws_vpc.main",
            "data.aws_availability_zones.available"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_security_group",
      "name": "alb",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:932453198323:security-group/sg-0cf8142dce37abceb",
            "description": "Allow HTTP from internet",
            "egress": [
              {
                "cidr_blocks": [
                  "0.0.0.0/0"
                ],
                "description": "Allow all outbound",
                "from_port": 0,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "-1",
                "security_groups": [],
                "self": false,
                "to_port": 0
              }
            ],
            "id": "sg-0cf8142dce37abceb",
            "ingress": [
              {
                "cidr_blocks": [
                  "0.0.0.0/0"
                ],
                "description": "HTTP from internet",
                "from_port": 80,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "tcp",
                "security_groups": [],
                "self": false,
                "to_port": 80
              }
            ],
            "name": "jubilee-cloud-foundation-alb-sg",
            "name_prefix": "",
            "owner_id": "932453198323",
            "revoke_rules_on_delete": false,
            "tags": {
              "Name": "alb-sg"
            },
            "tags_all": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Name": "alb-sg",
              "Project": "jubilee-cloud-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "timeouts": null,
            "vpc_id": "vpc-08f20136e1c09b684"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6OTAwMDAwMDAwMDAwfSwic2NoZW1hX3ZlcnNpb24iOiIxIn0=",
          "dependencies": [
            "aws_vpc.main"
          ],
          "create_before_destroy": true
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
            "arn": "arn:aws:ec2:us-east-1:932453198323:security-group/sg-0862e4861bec659ba",
            "description": "Allow SSH only from administrator IP",
            "egress": [
              {
                "cidr_blocks": [
                  "0.0.0.0/0"
                ],
                "description": "Allow all outbound",
                "from_port": 0,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "-1",
                "security_groups": [],
                "self": false,
                "to_port": 0
              }
            ],
            "id": "sg-0862e4861bec659ba",
            "ingress": [
              {
                "cidr_blocks": [
                  "41.212.120.18/32"
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
            "vpc_id": "vpc-08f20136e1c09b684"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6OTAwMDAwMDAwMDAwfSwic2NoZW1hX3ZlcnNpb24iOiIxIn0=",
          "dependencies": [
            "aws_vpc.main"
          ],
          "create_before_destroy": true
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
            "arn": "arn:aws:ec2:us-east-1:932453198323:security-group/sg-0ffc0561dc1c50ec2",
            "description": "Allow HTTP from ALB and SSH from Bastion",
            "egress": [
              {
                "cidr_blocks": [
                  "10.0.0.0/16"
                ],
                "description": "Allow outbound within VPC",
                "from_port": 0,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "-1",
                "security_groups": [],
                "self": false,
                "to_port": 0
              }
            ],
            "id": "sg-0ffc0561dc1c50ec2",
            "ingress": [
              {
                "cidr_blocks": [],
                "description": "HTTP from ALB",
                "from_port": 80,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "tcp",
                "security_groups": [
                  "sg-0cf8142dce37abceb"
                ],
                "self": false,
                "to_port": 80
              },
              {
                "cidr_blocks": [],
                "description": "SSH from Bastion",
                "from_port": 22,
                "ipv6_cidr_blocks": [],
                "prefix_list_ids": [],
                "protocol": "tcp",
                "security_groups": [
                  "sg-0862e4861bec659ba"
                ],
                "self": false,
                "to_port": 22
              }
            ],
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
            "vpc_id": "vpc-08f20136e1c09b684"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6OTAwMDAwMDAwMDAwfSwic2NoZW1hX3ZlcnNpb24iOiIxIn0=",
          "dependencies": [
            "aws_security_group.alb",
            "aws_security_group.bastion",
            "aws_vpc.main"
          ],
          "create_before_destroy": true
        }
      ]
    },
    {
      "mode": "managed",
      "type": "aws_subnet",
      "name": "private_a",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:932453198323:subnet/subnet-0afa00c9e26f3fec4",
            "assign_ipv6_address_on_creation": false,
            "availability_zone": "us-east-1a",
            "availability_zone_id": "use1-az1",
            "cidr_block": "10.0.2.0/24",
            "customer_owned_ipv4_pool": "",
            "enable_dns64": false,
            "enable_lni_at_device_index": 0,
            "enable_resource_name_dns_a_record_on_launch": false,
            "enable_resource_name_dns_aaaa_record_on_launch": false,
            "id": "subnet-0afa00c9e26f3fec4",
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
            "vpc_id": "vpc-08f20136e1c09b684"
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
      "name": "private_b",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:932453198323:subnet/subnet-07052247064b4c636",
            "assign_ipv6_address_on_creation": false,
            "availability_zone": "us-east-1b",
            "availability_zone_id": "use1-az2",
            "cidr_block": "10.0.4.0/24",
            "customer_owned_ipv4_pool": "",
            "enable_dns64": false,
            "enable_lni_at_device_index": 0,
            "enable_resource_name_dns_a_record_on_launch": false,
            "enable_resource_name_dns_aaaa_record_on_launch": false,
            "id": "subnet-07052247064b4c636",
            "ipv6_cidr_block": "",
            "ipv6_cidr_block_association_id": "",
            "ipv6_native": false,
            "map_customer_owned_ip_on_launch": false,
            "map_public_ip_on_launch": false,
            "outpost_arn": "",
            "owner_id": "932453198323",
            "private_dns_hostname_type_on_launch": "ip-name",
            "tags": {
              "Name": "private-subnet-b"
            },
            "tags_all": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Name": "private-subnet-b",
              "Project": "jubilee-cloud-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "timeouts": null,
            "vpc_id": "vpc-08f20136e1c09b684"
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
      "name": "public_a",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:932453198323:subnet/subnet-049b22ba8977d11a1",
            "assign_ipv6_address_on_creation": false,
            "availability_zone": "us-east-1a",
            "availability_zone_id": "use1-az1",
            "cidr_block": "10.0.1.0/24",
            "customer_owned_ipv4_pool": "",
            "enable_dns64": false,
            "enable_lni_at_device_index": 0,
            "enable_resource_name_dns_a_record_on_launch": false,
            "enable_resource_name_dns_aaaa_record_on_launch": false,
            "id": "subnet-049b22ba8977d11a1",
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
            "vpc_id": "vpc-08f20136e1c09b684"
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
      "name": "public_b",
      "provider": "provider[\"registry.terraform.io/hashicorp/aws\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "arn": "arn:aws:ec2:us-east-1:932453198323:subnet/subnet-05cba28450e6eecfb",
            "assign_ipv6_address_on_creation": false,
            "availability_zone": "us-east-1b",
            "availability_zone_id": "use1-az2",
            "cidr_block": "10.0.3.0/24",
            "customer_owned_ipv4_pool": "",
            "enable_dns64": false,
            "enable_lni_at_device_index": 0,
            "enable_resource_name_dns_a_record_on_launch": false,
            "enable_resource_name_dns_aaaa_record_on_launch": false,
            "id": "subnet-05cba28450e6eecfb",
            "ipv6_cidr_block": "",
            "ipv6_cidr_block_association_id": "",
            "ipv6_native": false,
            "map_customer_owned_ip_on_launch": false,
            "map_public_ip_on_launch": true,
            "outpost_arn": "",
            "owner_id": "932453198323",
            "private_dns_hostname_type_on_launch": "ip-name",
            "tags": {
              "Name": "public-subnet-b"
            },
            "tags_all": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Name": "public-subnet-b",
              "Project": "jubilee-cloud-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "timeouts": null,
            "vpc_id": "vpc-08f20136e1c09b684"
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
            "arn": "arn:aws:ec2:us-east-1:932453198323:vpc/vpc-08f20136e1c09b684",
            "assign_generated_ipv6_cidr_block": false,
            "cidr_block": "10.0.0.0/16",
            "default_network_acl_id": "acl-0c9975da48cc84ceb",
            "default_route_table_id": "rtb-099292aceace5c871",
            "default_security_group_id": "sg-0eb21582d28c90fd8",
            "dhcp_options_id": "dopt-06602ef479c9aead2",
            "enable_dns_hostnames": true,
            "enable_dns_support": true,
            "enable_network_address_usage_metrics": false,
            "id": "vpc-08f20136e1c09b684",
            "instance_tenancy": "default",
            "ipv4_ipam_pool_id": null,
            "ipv4_netmask_length": null,
            "ipv6_association_id": "",
            "ipv6_cidr_block": "",
            "ipv6_cidr_block_network_border_group": "",
            "ipv6_ipam_pool_id": "",
            "ipv6_netmask_length": 0,
            "main_route_table_id": "rtb-099292aceace5c871",
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
          "private": "eyJzY2hlbWFfdmVyc2lvbiI6IjEifQ==",
          "create_before_destroy": true
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
            "content_base64sha256": "bBUte3RaLB0hOZQhjQp+DbQdegIHDdS234Q8ZPcsHp4=",
            "content_base64sha512": "OyI2xttQCKm9j3GxsaZ7lrg58Q2KDUVoKsjuJPFfOQlrvBMCMVoUfcElecU9uzDCUljINuxWPJ9xXJ6OWlPkGQ==",
            "content_md5": "07a7bffe764a4bb5c6244722b3393c1a",
            "content_sha1": "260ff58d3d4ac44791c89f65bff6007ae08c51ac",
            "content_sha256": "6c152d7b745a2c1d213994218d0a7e0db41d7a02070dd4b6df843c64f72c1e9e",
            "content_sha512": "3b2236c6db5008a9bd8f71b1b1a67b96b839f10d8a0d45682ac8ee24f15f39096bbc1302315a147dc12579c53dbb30c25258c836ec563c9f715c9e8e5a53e419",
            "directory_permission": "0777",
            "file_permission": "0600",
            "filename": "./jubilee-cloud-foundation-key.pem",
            "id": "260ff58d3d4ac44791c89f65bff6007ae08c51ac",
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
            "id": "ffa6ea70529fb50a7d7bd4f1e9a2f8dd6465979d",
            "private_key_openssh": "-----BEGIN OPENSSH PRIVATE KEY-----\n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\n-----END OPENSSH PRIVATE KEY-----\n",
            "private_key_pem": "-----BEGIN RSA PRIVATE KEY-----\n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\n-----END RSA PRIVATE KEY-----\n",
            "private_key_pem_pkcs8": "-----BEGIN PRIVATE KEY-----\n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\nNeLSJwFu+7yzkpym4ArgJpwgXJP9\n-----END PRIVATE KEY-----\n",
            "public_key_fingerprint_md5": "e4:29:96:d4:ae:25:2f:31:00:1b:8f:ae:ae:d1:79:d1",
            "public_key_fingerprint_sha256": "SHA256:1CyX9gYaGxeRyC15K9dgVS1OHXC5CDajj3do3v2t7i4",
            "public_key_openssh": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDgi1VeYBx5OsJPV7Hdvts3aOSfiEnp6/UEVnM2P6YzZoQBvkKw4+NUiSdWTBNl3RMjvu+GOLMyygUm0MuWjiz8pNOeFmtg+GVV1UKSuWhUOwps0z+tiBnrVfz/LiRhaVwALGDWpOlOT36HKpdYm3QV/3vOadB6UOrErEd4jNwJWDO6KH6dalmasnLWhM47VuAXDDMoK5TVX7NqpMyT2euIcow04p+e2poT4psa0rz+RDf5l8gO5vJigc892cf+67eQJDXYvZLJtb9tTyWVKZ0+dZWwMD/wFsYa7kGTps3lnQn2PL1bjmqJXmqTPn3XNXYchbGvpKFOk+iy1A3O3KSdkr8iW6BJeYXU8Nv5+S1wH7sGx2lbgYbBH9F+LQhCRdX5KGlyeywUcWZSiSAV/xELWtWoTC/yfTR42Z+9bEcwCLTgfLbhfvGP04IU+LRR7ANsCHLhxew1pL6LZ17IaoUjLOjRDWFeu39/SIMuxcalRiVZmW93hon0JUp7Uq3rJ0SjQmfX6Jn2LLy7HYHoifaH6Xhyab6uwh9Gy10PsoQQNFGtii+FejOjxVw3dAlsC0urBPclqaCVgI5L48ue6McyScyBS/UDaiTTam36WLlFQJ4PIbGgXeSJjKONHxYQ1Pf91547aWf6gEVH8bIY+vXg6WoYXfEBX5eJFSH5uyxUDw==\n",
            "public_key_pem": "-----BEGIN PUBLIC KEY-----\nMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA4ItVXmAceTrCT1ex3b7b\nN2jkn4hJ6ev1BFZzNj+mM2aEAb5CsOPjVIknVkwTZd0TI77vhjizMsoFJtDLlo4s\n/KTTnhZrYPhlVdVCkrloVDsKbNM/rYgZ61X8/y4kYWlcACxg1qTpTk9+hyqXWJt0\nFf97zmnQelDqxKxHeIzcCVgzuih+nWpZmrJy1oTOO1bgFwwzKCuU1V+zaqTMk9nr\niHKMNOKfntqaE+KbGtK8/kQ3+ZfIDubyYoHPPdnH/uu3kCQ12L2SybW/bU8llSmd\nPnWVsDA/8BbGGu5Bk6bN5Z0J9jy9W45qiV5qkz591zV2HIWxr6ShTpPostQNztyk\nnZK/IlugSXmF1PDb+fktcB+7BsdpW4GGwR/Rfi0IQkXV+ShpcnssFHFmUokgFf8R\nC1rVqEwv8n00eNmfvWxHMAi04Hy24X7xj9OCFPi0UewDbAhy4cXsNaS+i2deyGqF\nIyzo0Q1hXrt/f0iDLsXGpUYlWZlvd4aJ9CVKe1Kt6ydEo0Jn1+iZ9iy8ux2B6In2\nh+l4cmm+rsIfRstdD7KEEDRRrYovhXozo8VcN3QJbAtLqwT3JamglYCOS+PLnujH\nMknMgUv1A2ok02pt+li5RUCeDyGxoF3kiYyjjR8WENT3/deeO2ln+oBFR/GyGPr1\n4OlqGF3xAV+XiRUh+bssVA8CAwEAAQ==\n-----END PUBLIC KEY-----\n",
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
          "identity_schema_version": 0,
          "create_before_destroy": true
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

public_subnet_b_cidr = "10.0.3.0/24"

private_subnet_b_cidr = "10.0.4.0/24"

instance_type = "t2.micro"

# Replace this with your real public IP.
# Example:
# my_ip = "197.232.10.55/32"
my_ip = "41.212.120.18/32"

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

variable "public_subnet_b_cidr" {
  description = "CIDR block for the second public subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_subnet_b_cidr" {
  description = "CIDR block for the second private subnet"
  type        = string
  default     = "10.0.4.0/24"
}
```


<div style='page-break-after: always;'></div>

# File: web_user_data.sh

```sh
#!/bin/bash
# Create web folder
mkdir -p /var/www/web

# Create simple web page (Notice 'HTML' is unquoted so $(hostname) expands!)
cat > /var/www/web/index.html <<HTML
<html>
  <body>
    <h1>Jubilee Cloud Foundation</h1>
    <p>This web server is running in a private subnet.</p>
    <p><strong>Served by: $(hostname)</strong></p>
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

