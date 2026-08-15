# Staff Canteen Management System

Generated: 08/14/2026 20:55:58

---

## Table of Contents

- .terraform.lock.hcl
- .terraform\providers\registry.terraform.io\hashicorp\google\5.45.2\windows_amd64\LICENSE.txt
- .terraform\providers\registry.terraform.io\hashicorp\google\6.50.0\windows_amd64\LICENSE.txt
- .terraform\providers\registry.terraform.io\hashicorp\local\2.9.0\windows_amd64\LICENSE.txt
- .terraform\providers\registry.terraform.io\hashicorp\tls\4.3.0\windows_amd64\LICENSE.txt
- main.tf
- outputs.tf
- run.md
- terraform.tfstate
- terraform.tfstate.backup
- terraform.tfvars
- terraform-sa.json
- variables.tf
- web_user_data.sh

---


<div style='page-break-after: always;'></div>

# File: .terraform.lock.hcl

```hcl
# This file is maintained automatically by "terraform init".
# Manual edits may be lost in future updates.

provider "registry.terraform.io/hashicorp/google" {
  version     = "6.50.0"
  constraints = "~> 6.0"
  hashes = [
    "h1:DNt2+WSTnrNlWVUml87IQb+f/aICd3TKETxWIJAELyA=",
    "zh:1f3513fcfcbf7ca53d667a168c5067a4dd91a4d4cccd19743e248ff31065503c",
    "zh:3da7db8fc2c51a77dd958ea8baaa05c29cd7f829bd8941c26e2ea9cb3aadc1e5",
    "zh:3e09ac3f6ca8111cbb659d38c251771829f4347ab159a12db195e211c76068bb",
    "zh:7bb9e41c568df15ccf1a8946037355eefb4dfb4e35e3b190808bb7c4abae547d",
    "zh:81e5d78bdec7778e6d67b5c3544777505db40a826b6eb5abe9b86d4ba396866b",
    "zh:8d309d020fb321525883f5c4ea864df3d5942b6087f6656d6d8b3a1377f340fc",
    "zh:93e112559655ab95a523193158f4a4ac0f2bfed7eeaa712010b85ebb551d5071",
    "zh:d3efe589ffd625b300cef5917c4629513f77e3a7b111c9df65075f76a46a63c7",
    "zh:d4a4d672bbef756a870d8f32b35925f8ce2ef4f6bbd5b71a3cb764f1b6c85421",
    "zh:e13a86bca299ba8a118e80d5f84fbdd708fe600ecdceea1a13d4919c068379fe",
    "zh:f569b65999264a9416862bca5cd2a6177d94ccb0424f3a4ef424428912b9cb3c",
    "zh:fec30c095647b583a246c39d557704947195a1b7d41f81e369ba377d997faef6",
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

# File: .terraform\providers\registry.terraform.io\hashicorp\google\5.45.2\windows_amd64\LICENSE.txt

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

# File: .terraform\providers\registry.terraform.io\hashicorp\google\6.50.0\windows_amd64\LICENSE.txt

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
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
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

provider "google" {
  impersonate_service_account = "terraform-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com"
  project                     = var.project_id
  region                      = var.region
  zone                        = var.zone
}

###############################################################
# Local values
###############################################################

locals {
  ssh_metadata = "ubuntu:${tls_private_key.ssh.public_key_openssh}"

  bastion_startup_script = <<EOF
#!/bin/bash
apt-get update
apt-get install -y curl
EOF

  web_user_data = file("${path.module}/web_user_data.sh")
}

###############################################################
# Enable required GCP APIs
###############################################################

resource "google_project_service" "services" {
  for_each = toset([
    "compute.googleapis.com",
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "billingbudgets.googleapis.com",
    "monitoring.googleapis.com",
  ])

  project            = var.project_id
  service            = each.value
  disable_on_destroy = false
}

###############################################################
# SSH key pair
###############################################################

resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "ssh_private_key" {
  filename        = "${path.module}/${var.project}-key.pem"
  content         = tls_private_key.ssh.private_key_pem
  file_permission = "0600"
}

###############################################################
# VPC network
###############################################################

resource "google_compute_network" "main" {
  name                    = "${var.project}-vpc"
  project                 = var.project_id
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"

  depends_on = [
    google_project_service.services
  ]
}

###############################################################
# Subnets
###############################################################

resource "google_compute_subnetwork" "public" {
  name          = "public-subnet-a"
  project       = var.project_id
  region        = var.region
  network       = google_compute_network.main.id
  ip_cidr_range = var.public_subnet_cidr
}

resource "google_compute_subnetwork" "private" {
  name          = "private-subnet-a"
  project       = var.project_id
  region        = var.region
  network       = google_compute_network.main.id
  ip_cidr_range = var.private_subnet_cidr
}

###############################################################
# Firewall rules
###############################################################

resource "google_compute_firewall" "allow_ssh_to_bastion" {
  name    = "allow-ssh-to-bastion"
  project = var.project_id
  network = google_compute_network.main.name

  direction = "INGRESS"
  priority  = 1000

  source_ranges = [var.my_ip]
  target_tags   = ["bastion"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "allow_http_from_bastion_to_web" {
  name    = "allow-http-from-bastion-to-web"
  project = var.project_id
  network = google_compute_network.main.name

  direction = "INGRESS"
  priority  = 1000

  source_tags = ["bastion"]
  target_tags = ["web"]

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}

###############################################################
# Workload service accounts
###############################################################

resource "google_service_account" "bastion" {
  account_id   = "bastion-sa"
  display_name = "Bastion Service Account"
  project      = var.project_id

  depends_on = [
    google_project_service.services
  ]
}

resource "google_service_account" "web" {
  account_id   = "web-sa"
  display_name = "Private Web Service Account"
  project      = var.project_id

  depends_on = [
    google_project_service.services
  ]
}

resource "google_project_iam_member" "bastion_logging" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.bastion.email}"
}

resource "google_project_iam_member" "bastion_monitoring" {
  project = var.project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.bastion.email}"
}

resource "google_project_iam_member" "web_logging" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.web.email}"
}

resource "google_project_iam_member" "web_monitoring" {
  project = var.project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.web.email}"
}

###############################################################
# Human IAM Role Assignments (RBAC)
# Maps Gmail accounts to GCP Project Roles
###############################################################

locals {
  iam_bindings = flatten([
    for role, members in {
      "roles/editor"                          = concat(var.admin_members, var.engineer_members) # did not use "roles/owner" due to ORG_MUST_INVITE_EXTERNAL_OWNERS policy. Email must be invited via GUI
      "roles/resourcemanager.projectIamAdmin" = var.admin_members
      "roles/viewer"                          = var.auditor_members
      } : [
      for member in members : {
        role   = role
        member = member
      }
    ]
  ])
}

resource "google_project_iam_member" "human_roles" {
  for_each = { for idx, binding in local.iam_bindings : "${binding.role}-${binding.member}" => binding }

  project = var.project_id
  role    = each.value.role
  member  = each.value.member

  depends_on = [
    google_project_service.services
  ]
}

###############################################################
# Compute instances
###############################################################

resource "google_compute_instance" "bastion" {
  name         = "bastion"
  project      = var.project_id
  zone         = var.zone
  machine_type = var.machine_type
  tags         = ["bastion"]

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2204-lts"
      size  = 10
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.public.id

    access_config {
      # Ephemeral external IP
    }
  }

  metadata = {
    ssh-keys = local.ssh_metadata
  }

  metadata_startup_script = local.bastion_startup_script

  service_account {
    email = google_service_account.bastion.email
    scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write"
    ]
  }

  depends_on = [
    google_project_service.services
  ]
}

resource "google_compute_instance" "web_private" {
  name         = "web-private"
  project      = var.project_id
  zone         = var.zone
  machine_type = var.machine_type
  tags         = ["web"]

  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2204-lts"
      size  = 10
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.private.id

    # No access_config means no external IP.
  }

  metadata = {
    ssh-keys = local.ssh_metadata
  }

  metadata_startup_script = local.web_user_data

  service_account {
    email = google_service_account.web.email
    scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write"
    ]
  }

  depends_on = [
    google_project_service.services
  ]
}

###############################################################
# Budget alert email channels
###############################################################

resource "google_monitoring_notification_channel" "budget_email" {
  for_each = toset(var.billing_alert_emails)

  project      = var.project_id
  display_name = "Budget alert - ${each.value}"
  type         = "email"

  labels = {
    email_address = each.value
  }

  depends_on = [
    google_project_service.services
  ]
}

###############################################################
# Billing budget - FinOps / Cost Governance
###############################################################

resource "google_billing_budget" "learning" {
  billing_account = var.billing_account_id
  display_name    = "${var.project}-learning-budget"

  amount {
    specified_amount {
      currency_code = "USD"
      units         = tostring(var.monthly_budget_limit)
    }
  }

  threshold_rules {
    threshold_percent = 0.8
  }

  all_updates_rule {
    monitoring_notification_channels = [
      for channel in google_monitoring_notification_channel.budget_email : channel.id
    ]
  }

  depends_on = [
    google_project_service.services
  ]
}
```


<div style='page-break-after: always;'></div>

# File: outputs.tf

```tf
output "project_id" {
  description = "GCP project ID"
  value       = var.project_id
}

output "vpc_id" {
  description = "GCP VPC network ID"
  value       = google_compute_network.main.id
}

output "public_subnet_id" {
  description = "Public subnet ID"
  value       = google_compute_subnetwork.public.id
}

output "private_subnet_id" {
  description = "Private subnet ID"
  value       = google_compute_subnetwork.private.id
}

output "bastion_external_ip" {
  description = "External IP of the bastion server"
  value       = google_compute_instance.bastion.network_interface[0].access_config[0].nat_ip
}

output "bastion_internal_ip" {
  description = "Internal IP of the bastion server"
  value       = google_compute_instance.bastion.network_interface[0].network_ip
}

output "web_internal_ip" {
  description = "Internal IP of the private web server"
  value       = google_compute_instance.web_private.network_interface[0].network_ip
}

output "ssh_private_key_file" {
  description = "Path to the generated private SSH key"
  value       = local_file.ssh_private_key.filename
}

output "ssh_command" {
  description = "SSH command to connect to the bastion server"
  value       = "ssh -i ./${var.project}-key.pem ubuntu@${google_compute_instance.bastion.network_interface[0].access_config[0].nat_ip}"
}

output "human_iam_bindings" {
  description = "Gmail accounts mapped to GCP project roles"
  value = {
    for key, binding in google_project_iam_member.human_roles :
    key => "${binding.member} -> ${binding.role}"
  }
}
```


<div style='page-break-after: always;'></div>

# File: run.md

```md
# Setup IP Address in terraform.tfvars

Your IP Address changes everytime your internet connection disconects and reconects again.






Yes, let's do it. This is the approach I'd use in production anyway, because Terraform should ideally authenticate with a dedicated service account rather than a personal account.

However, there's **one important correction** to what I suggested earlier:

> **A service account cannot be directly added to a Cloud Billing Account IAM policy.** Billing account IAM supports users, groups, and domains—not service accounts in the way project IAM does. For Terraform, what you typically do is grant the service account the necessary project permissions and authenticate with it. If creating budgets still requires billing-account permissions in your environment, you may need to impersonate a user with billing privileges or use a different authentication flow. Let's first create the service account and test whether it resolves the ADC issue.

---

# Step 1: Create the service account

Run:

```powershell
gcloud iam service-accounts create terraform-sa `
    --project=project-2978a6d6-1bf2-4d65-996 `
    --display-name="Terraform Service Account"
```

Verify it exists:

```powershell
gcloud iam service-accounts list --project=project-2978a6d6-1bf2-4d65-996
```

You should see something like:

```
terraform-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com
```

---

# Step 2: Impersonate service account

gcloud iam service-accounts add-iam-policy-binding `
  terraform-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com `
  --member="user:ahoosoftwares@gmail.com" `
  --role="roles/iam.serviceAccountTokenCreator"



# Step 3: Terraform provider should look like

provider "google" {
  impersonate_service_account = "terraform-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com"

  project = var.project_id
  region  = var.region
  zone    = var.zone
}



# Step 4: Go to console GUI to give service account role: Billing Account Administrator

or Cloud Billing Account IAM, the supported way is through the Google Cloud Console, or by using the Cloud Billing IAM API directly.

The easiest way is through the Cloud Console
Go to Google Cloud Console.
Open Billing.
Select My Billing Account.
Click Account management (or Permissions, depending on the UI).
Click Add principal.
Add:
terraform-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com
Grant:
Billing Account Administrator (roles/billing.admin)

Save the change.

# Tell computer new ssh key for bastion vm instance

ssh-keygen -R xx.xxx.xx.xx -> put the ip address in the ssh command

# Fix SSH Key Permissions on Windows

icacls .\jubilee-gcp-foundation-key.pem /inheritance:r
icacls .\jubilee-gcp-foundation-key.pem /grant:r "${env:USERNAME}:(R)"


# Get ssh command to connect to bastion in the public subnet 

terraform output ssh_command



# Get the private web IP Address

terraform output web_internal_ip

# From bastion test this 

curl http://WEB_INTERNAL_IP
```


<div style='page-break-after: always;'></div>

# File: terraform.tfstate

```tfstate
{
  "version": 4,
  "terraform_version": "1.15.2",
  "serial": 608,
  "lineage": "6c3cede5-faba-93bb-2f62-33d779d04ee6",
  "outputs": {},
  "resources": [],
  "check_results": [
    {
      "object_kind": "var",
      "config_addr": "var.billing_account_id",
      "status": "unknown",
      "objects": null
    },
    {
      "object_kind": "var",
      "config_addr": "var.billing_alert_emails",
      "status": "unknown",
      "objects": null
    },
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
  "serial": 579,
  "lineage": "6c3cede5-faba-93bb-2f62-33d779d04ee6",
  "outputs": {
    "bastion_external_ip": {
      "value": "34.24.218.185",
      "type": "string"
    },
    "bastion_internal_ip": {
      "value": "10.0.1.2",
      "type": "string"
    },
    "human_iam_bindings": {
      "value": {
        "roles/editor-user:ahoosoftware@gmail.com": "user:ahoosoftware@gmail.com -\u003e roles/editor",
        "roles/editor-user:harryoduwor@gmail.com": "user:harryoduwor@gmail.com -\u003e roles/editor",
        "roles/resourcemanager.projectIamAdmin-user:harryoduwor@gmail.com": "user:harryoduwor@gmail.com -\u003e roles/resourcemanager.projectIamAdmin",
        "roles/viewer-user:legitimatecomputers@gmail.com": "user:legitimatecomputers@gmail.com -\u003e roles/viewer"
      },
      "type": [
        "object",
        {
          "roles/editor-user:ahoosoftware@gmail.com": "string",
          "roles/editor-user:harryoduwor@gmail.com": "string",
          "roles/resourcemanager.projectIamAdmin-user:harryoduwor@gmail.com": "string",
          "roles/viewer-user:legitimatecomputers@gmail.com": "string"
        }
      ]
    },
    "private_subnet_id": {
      "value": "projects/project-2978a6d6-1bf2-4d65-996/regions/us-east1/subnetworks/private-subnet-a",
      "type": "string"
    },
    "project_id": {
      "value": "project-2978a6d6-1bf2-4d65-996",
      "type": "string"
    },
    "public_subnet_id": {
      "value": "projects/project-2978a6d6-1bf2-4d65-996/regions/us-east1/subnetworks/public-subnet-a",
      "type": "string"
    },
    "ssh_command": {
      "value": "ssh -i ./jubilee-gcp-foundation-key.pem ubuntu@34.24.218.185",
      "type": "string"
    },
    "ssh_private_key_file": {
      "value": "./jubilee-gcp-foundation-key.pem",
      "type": "string"
    },
    "vpc_id": {
      "value": "projects/project-2978a6d6-1bf2-4d65-996/global/networks/jubilee-gcp-foundation-vpc",
      "type": "string"
    },
    "web_internal_ip": {
      "value": "10.0.2.2",
      "type": "string"
    }
  },
  "resources": [
    {
      "mode": "managed",
      "type": "google_billing_budget",
      "name": "learning",
      "provider": "provider[\"registry.terraform.io/hashicorp/google\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "all_updates_rule": [
              {
                "disable_default_iam_recipients": false,
                "enable_project_level_recipients": false,
                "monitoring_notification_channels": [
                  "projects/project-2978a6d6-1bf2-4d65-996/notificationChannels/14939071063469696694",
                  "projects/project-2978a6d6-1bf2-4d65-996/notificationChannels/14939071063469697243",
                  "projects/project-2978a6d6-1bf2-4d65-996/notificationChannels/6188100172646656995"
                ],
                "pubsub_topic": "",
                "schema_version": "1.0"
              }
            ],
            "amount": [
              {
                "last_period_amount": false,
                "specified_amount": [
                  {
                    "currency_code": "USD",
                    "nanos": 0,
                    "units": "5"
                  }
                ]
              }
            ],
            "billing_account": "01FA5C-32C9B9-EB5D46",
            "budget_filter": [
              {
                "calendar_period": "MONTH",
                "credit_types": [],
                "credit_types_treatment": "INCLUDE_ALL_CREDITS",
                "custom_period": [],
                "labels": {},
                "projects": [],
                "resource_ancestors": [],
                "services": [],
                "subaccounts": []
              }
            ],
            "display_name": "jubilee-gcp-foundation-learning-budget",
            "id": "billingAccounts/01FA5C-32C9B9-EB5D46/budgets/732bf19e-2c92-452a-b4ad-1af6598b7f5a",
            "name": "732bf19e-2c92-452a-b4ad-1af6598b7f5a",
            "ownership_scope": "",
            "threshold_rules": [
              {
                "spend_basis": "CURRENT_SPEND",
                "threshold_percent": 0.8
              }
            ],
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9",
          "dependencies": [
            "google_monitoring_notification_channel.budget_email",
            "google_project_service.services"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "google_compute_firewall",
      "name": "allow_http_from_bastion_to_web",
      "provider": "provider[\"registry.terraform.io/hashicorp/google\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "allow": [
              {
                "ports": [
                  "80"
                ],
                "protocol": "tcp"
              }
            ],
            "creation_timestamp": "2026-08-06T05:27:41.957-07:00",
            "deny": [],
            "description": "",
            "destination_ranges": [],
            "direction": "INGRESS",
            "disabled": false,
            "enable_logging": null,
            "id": "projects/project-2978a6d6-1bf2-4d65-996/global/firewalls/allow-http-from-bastion-to-web",
            "log_config": [],
            "name": "allow-http-from-bastion-to-web",
            "network": "https://www.googleapis.com/compute/v1/projects/project-2978a6d6-1bf2-4d65-996/global/networks/jubilee-gcp-foundation-vpc",
            "params": [],
            "priority": 1000,
            "project": "project-2978a6d6-1bf2-4d65-996",
            "self_link": "https://www.googleapis.com/compute/v1/projects/project-2978a6d6-1bf2-4d65-996/global/firewalls/allow-http-from-bastion-to-web",
            "source_ranges": null,
            "source_service_accounts": null,
            "source_tags": [
              "bastion"
            ],
            "target_service_accounts": null,
            "target_tags": [
              "web"
            ],
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9",
          "dependencies": [
            "google_compute_network.main",
            "google_project_service.services"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "google_compute_firewall",
      "name": "allow_ssh_to_bastion",
      "provider": "provider[\"registry.terraform.io/hashicorp/google\"]",
      "instances": [
        {
          "schema_version": 1,
          "attributes": {
            "allow": [
              {
                "ports": [
                  "22"
                ],
                "protocol": "tcp"
              }
            ],
            "creation_timestamp": "2026-08-06T05:27:41.819-07:00",
            "deny": [],
            "description": "",
            "destination_ranges": [],
            "direction": "INGRESS",
            "disabled": false,
            "enable_logging": null,
            "id": "projects/project-2978a6d6-1bf2-4d65-996/global/firewalls/allow-ssh-to-bastion",
            "log_config": [],
            "name": "allow-ssh-to-bastion",
            "network": "https://www.googleapis.com/compute/v1/projects/project-2978a6d6-1bf2-4d65-996/global/networks/jubilee-gcp-foundation-vpc",
            "params": [],
            "priority": 1000,
            "project": "project-2978a6d6-1bf2-4d65-996",
            "self_link": "https://www.googleapis.com/compute/v1/projects/project-2978a6d6-1bf2-4d65-996/global/firewalls/allow-ssh-to-bastion",
            "source_ranges": [
              "41.139.243.97/32"
            ],
            "source_service_accounts": null,
            "source_tags": null,
            "target_service_accounts": null,
            "target_tags": [
              "bastion"
            ],
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9",
          "dependencies": [
            "google_compute_network.main",
            "google_project_service.services"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "google_compute_instance",
      "name": "bastion",
      "provider": "provider[\"registry.terraform.io/hashicorp/google\"]",
      "instances": [
        {
          "schema_version": 6,
          "attributes": {
            "advanced_machine_features": [],
            "allow_stopping_for_update": null,
            "attached_disk": [],
            "boot_disk": [
              {
                "auto_delete": true,
                "device_name": "persistent-disk-0",
                "disk_encryption_key_raw": "",
                "disk_encryption_key_rsa": "",
                "disk_encryption_key_sha256": "",
                "disk_encryption_service_account": "",
                "force_attach": false,
                "guest_os_features": [
                  "VIRTIO_SCSI_MULTIQUEUE",
                  "SEV_CAPABLE",
                  "SEV_SNP_CAPABLE",
                  "SEV_LIVE_MIGRATABLE",
                  "SEV_LIVE_MIGRATABLE_V2",
                  "IDPF",
                  "TDX_CAPABLE",
                  "UEFI_COMPATIBLE",
                  "GVNIC"
                ],
                "initialize_params": [
                  {
                    "architecture": "X86_64",
                    "enable_confidential_compute": false,
                    "image": "https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20260731",
                    "labels": {},
                    "provisioned_iops": 0,
                    "provisioned_throughput": 0,
                    "resource_manager_tags": null,
                    "resource_policies": [],
                    "size": 10,
                    "snapshot": "",
                    "source_image_encryption_key": [],
                    "source_snapshot_encryption_key": [],
                    "storage_pool": "",
                    "type": "pd-standard"
                  }
                ],
                "interface": "",
                "kms_key_self_link": "",
                "mode": "READ_WRITE",
                "source": "https://www.googleapis.com/compute/v1/projects/project-2978a6d6-1bf2-4d65-996/zones/us-east1-b/disks/bastion"
              }
            ],
            "can_ip_forward": false,
            "confidential_instance_config": [],
            "cpu_platform": "Intel Broadwell",
            "creation_timestamp": "2026-08-06T05:27:56.465-07:00",
            "current_status": "RUNNING",
            "deletion_protection": false,
            "description": "",
            "desired_status": null,
            "effective_labels": {
              "goog-terraform-provisioned": "true"
            },
            "enable_display": false,
            "guest_accelerator": [],
            "hostname": "",
            "id": "projects/project-2978a6d6-1bf2-4d65-996/zones/us-east1-b/instances/bastion",
            "instance_encryption_key": [],
            "instance_id": "2506694894397539107",
            "key_revocation_action_type": "",
            "label_fingerprint": "vezUS-42LLM=",
            "labels": null,
            "machine_type": "e2-micro",
            "metadata": {
              "ssh-keys": "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCdRpl7WcATmembpCMp7SNsbUK3dD2XcbDWSHmLdO9Ccu6jOjmqxFMaXlQHzjZZwdhWloPcct6Yy+e9LzPM9CtF0LVIZT0+7Y18vk8IHB7ssXWTaXBdANvOex0h+Fh7BTyQ6dVxD6+uRAY9D4nvD5OB9zoxX9NU2ioMJJZ6YuoH/B3FgwlnKzgA4XKGULsV5Pcau++VcZsp5dcL42tVxkIn/TYZLvqwkVRrFBWvrLtSKv4o8yPE2cTB27fq3mb8eOsk8pv5dwtqa+Oa1iwThkLhqSKnHY1pngRnYwr1PU6P5jcEkWK+fysvX84m5wyGc2UqVkqjfjRbitU3bH1YD8lfiV/qj23bPtQsinXxyWURhQke7VQFShiz3FxPqF1lBCtNeaGhGfaZ9RnnappnfsKVpVht6nYsYE+Ko6sxobMrKcewvKybGw//EmUXU21mr+VRmSSJKly9XaJgukEuP8gyo62SXg2xj8wnvJV6bqsPB0zblrTcmGDD4nVYUna7v/z8McGoQrhHUHcUyFZrybpjzPXqDqglxgpFUBRUJAZvb3G4qdkcO6c3NP4zGDZyDckPDKQsfTkFtJh8wAzu6rm5xI/B9x4fVozPEaomVZC3ZZGTh7hiRDD3GgeXMrWinFKra5fBzp3okGIE/RPBvR4Zcz96jsh6oAMNma4YLTt1Jw==\n"
            },
            "metadata_fingerprint": "p4hMyu1YAv4=",
            "metadata_startup_script": "#!/bin/bash\r\napt-get update\r\napt-get install -y curl\r\n",
            "min_cpu_platform": "",
            "name": "bastion",
            "network_interface": [
              {
                "access_config": [
                  {
                    "nat_ip": "34.24.218.185",
                    "network_tier": "PREMIUM",
                    "public_ptr_domain_name": ""
                  }
                ],
                "alias_ip_range": [],
                "internal_ipv6_prefix_length": 0,
                "ipv6_access_config": [],
                "ipv6_access_type": "",
                "ipv6_address": "",
                "name": "nic0",
                "network": "https://www.googleapis.com/compute/v1/projects/project-2978a6d6-1bf2-4d65-996/global/networks/jubilee-gcp-foundation-vpc",
                "network_attachment": "",
                "network_ip": "10.0.1.2",
                "nic_type": "",
                "queue_count": 0,
                "stack_type": "IPV4_ONLY",
                "subnetwork": "https://www.googleapis.com/compute/v1/projects/project-2978a6d6-1bf2-4d65-996/regions/us-east1/subnetworks/public-subnet-a",
                "subnetwork_project": "project-2978a6d6-1bf2-4d65-996"
              }
            ],
            "network_performance_config": [],
            "params": [],
            "project": "project-2978a6d6-1bf2-4d65-996",
            "reservation_affinity": [],
            "resource_policies": null,
            "scheduling": [
              {
                "automatic_restart": true,
                "availability_domain": 0,
                "instance_termination_action": "",
                "local_ssd_recovery_timeout": [],
                "max_run_duration": [],
                "min_node_cpus": 0,
                "node_affinities": [],
                "on_host_maintenance": "MIGRATE",
                "on_instance_stop_action": [],
                "preemptible": false,
                "provisioning_model": "STANDARD",
                "termination_time": ""
              }
            ],
            "scratch_disk": [],
            "self_link": "https://www.googleapis.com/compute/v1/projects/project-2978a6d6-1bf2-4d65-996/zones/us-east1-b/instances/bastion",
            "service_account": [
              {
                "email": "bastion-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com",
                "scopes": [
                  "https://www.googleapis.com/auth/logging.write",
                  "https://www.googleapis.com/auth/monitoring.write"
                ]
              }
            ],
            "shielded_instance_config": [
              {
                "enable_integrity_monitoring": true,
                "enable_secure_boot": false,
                "enable_vtpm": true
              }
            ],
            "tags": [
              "bastion"
            ],
            "tags_fingerprint": "NfTTNVh6sLU=",
            "terraform_labels": {
              "goog-terraform-provisioned": "true"
            },
            "timeouts": null,
            "zone": "us-east1-b"
          },
          "sensitive_attributes": [
            [
              {
                "type": "get_attr",
                "value": "boot_disk"
              },
              {
                "type": "index",
                "value": {
                  "value": 0,
                  "type": "number"
                }
              },
              {
                "type": "get_attr",
                "value": "disk_encryption_key_raw"
              }
            ],
            [
              {
                "type": "get_attr",
                "value": "boot_disk"
              },
              {
                "type": "index",
                "value": {
                  "value": 0,
                  "type": "number"
                }
              },
              {
                "type": "get_attr",
                "value": "disk_encryption_key_rsa"
              }
            ]
          ],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiNiJ9",
          "dependencies": [
            "google_compute_network.main",
            "google_compute_subnetwork.public",
            "google_project_service.services",
            "google_service_account.bastion",
            "tls_private_key.ssh"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "google_compute_instance",
      "name": "web_private",
      "provider": "provider[\"registry.terraform.io/hashicorp/google\"]",
      "instances": [
        {
          "schema_version": 6,
          "attributes": {
            "advanced_machine_features": [],
            "allow_stopping_for_update": null,
            "attached_disk": [],
            "boot_disk": [
              {
                "auto_delete": true,
                "device_name": "persistent-disk-0",
                "disk_encryption_key_raw": "",
                "disk_encryption_key_rsa": "",
                "disk_encryption_key_sha256": "",
                "disk_encryption_service_account": "",
                "force_attach": false,
                "guest_os_features": [
                  "VIRTIO_SCSI_MULTIQUEUE",
                  "SEV_CAPABLE",
                  "SEV_SNP_CAPABLE",
                  "SEV_LIVE_MIGRATABLE",
                  "SEV_LIVE_MIGRATABLE_V2",
                  "IDPF",
                  "TDX_CAPABLE",
                  "UEFI_COMPATIBLE",
                  "GVNIC"
                ],
                "initialize_params": [
                  {
                    "architecture": "X86_64",
                    "enable_confidential_compute": false,
                    "image": "https://www.googleapis.com/compute/v1/projects/ubuntu-os-cloud/global/images/ubuntu-2204-jammy-v20260731",
                    "labels": {},
                    "provisioned_iops": 0,
                    "provisioned_throughput": 0,
                    "resource_manager_tags": null,
                    "resource_policies": [],
                    "size": 10,
                    "snapshot": "",
                    "source_image_encryption_key": [],
                    "source_snapshot_encryption_key": [],
                    "storage_pool": "",
                    "type": "pd-standard"
                  }
                ],
                "interface": "",
                "kms_key_self_link": "",
                "mode": "READ_WRITE",
                "source": "https://www.googleapis.com/compute/v1/projects/project-2978a6d6-1bf2-4d65-996/zones/us-east1-b/disks/web-private"
              }
            ],
            "can_ip_forward": false,
            "confidential_instance_config": [],
            "cpu_platform": "Intel Broadwell",
            "creation_timestamp": "2026-08-06T05:27:56.072-07:00",
            "current_status": "RUNNING",
            "deletion_protection": false,
            "description": "",
            "desired_status": null,
            "effective_labels": {
              "goog-terraform-provisioned": "true"
            },
            "enable_display": false,
            "guest_accelerator": [],
            "hostname": "",
            "id": "projects/project-2978a6d6-1bf2-4d65-996/zones/us-east1-b/instances/web-private",
            "instance_encryption_key": [],
            "instance_id": "1677451325037200164",
            "key_revocation_action_type": "",
            "label_fingerprint": "vezUS-42LLM=",
            "labels": null,
            "machine_type": "e2-micro",
            "metadata": {
              "ssh-keys": "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCdRpl7WcATmembpCMp7SNsbUK3dD2XcbDWSHmLdO9Ccu6jOjmqxFMaXlQHzjZZwdhWloPcct6Yy+e9LzPM9CtF0LVIZT0+7Y18vk8IHB7ssXWTaXBdANvOex0h+Fh7BTyQ6dVxD6+uRAY9D4nvD5OB9zoxX9NU2ioMJJZ6YuoH/B3FgwlnKzgA4XKGULsV5Pcau++VcZsp5dcL42tVxkIn/TYZLvqwkVRrFBWvrLtSKv4o8yPE2cTB27fq3mb8eOsk8pv5dwtqa+Oa1iwThkLhqSKnHY1pngRnYwr1PU6P5jcEkWK+fysvX84m5wyGc2UqVkqjfjRbitU3bH1YD8lfiV/qj23bPtQsinXxyWURhQke7VQFShiz3FxPqF1lBCtNeaGhGfaZ9RnnappnfsKVpVht6nYsYE+Ko6sxobMrKcewvKybGw//EmUXU21mr+VRmSSJKly9XaJgukEuP8gyo62SXg2xj8wnvJV6bqsPB0zblrTcmGDD4nVYUna7v/z8McGoQrhHUHcUyFZrybpjzPXqDqglxgpFUBRUJAZvb3G4qdkcO6c3NP4zGDZyDckPDKQsfTkFtJh8wAzu6rm5xI/B9x4fVozPEaomVZC3ZZGTh7hiRDD3GgeXMrWinFKra5fBzp3okGIE/RPBvR4Zcz96jsh6oAMNma4YLTt1Jw==\n"
            },
            "metadata_fingerprint": "CdqhNOeqKoo=",
            "metadata_startup_script": "#!/bin/bash\n\n# Create web folder\nmkdir -p /var/www/web\n\n# Create simple web page\ncat \u003e /var/www/web/index.html \u003c\u003c'HTML'\n\u003chtml\u003e\n  \u003cbody\u003e\n    \u003ch1\u003eJubilee Cloud Foundation\u003c/h1\u003e\n    \u003cp\u003eThis web server is running in a private GCP subnet.\u003c/p\u003e\n    \u003cp\u003eOnly approved internal traffic can reach it.\u003c/p\u003e\n  \u003c/body\u003e\n\u003c/html\u003e\nHTML\n\n# Create systemd service\ncat \u003e /etc/systemd/system/simple-web.service \u003c\u003c'UNIT'\n[Unit]\nDescription=Simple Python Web Server\nAfter=network.target\n\n[Service]\nExecStart=/usr/bin/python3 -m http.server 80 --directory /var/www/web\nRestart=always\nUser=root\n\n[Install]\nWantedBy=multi-user.target\nUNIT\n\n# Enable and start service\nsystemctl daemon-reload\nsystemctl enable --now simple-web.service",
            "min_cpu_platform": "",
            "name": "web-private",
            "network_interface": [
              {
                "access_config": [],
                "alias_ip_range": [],
                "internal_ipv6_prefix_length": 0,
                "ipv6_access_config": [],
                "ipv6_access_type": "",
                "ipv6_address": "",
                "name": "nic0",
                "network": "https://www.googleapis.com/compute/v1/projects/project-2978a6d6-1bf2-4d65-996/global/networks/jubilee-gcp-foundation-vpc",
                "network_attachment": "",
                "network_ip": "10.0.2.2",
                "nic_type": "",
                "queue_count": 0,
                "stack_type": "IPV4_ONLY",
                "subnetwork": "https://www.googleapis.com/compute/v1/projects/project-2978a6d6-1bf2-4d65-996/regions/us-east1/subnetworks/private-subnet-a",
                "subnetwork_project": "project-2978a6d6-1bf2-4d65-996"
              }
            ],
            "network_performance_config": [],
            "params": [],
            "project": "project-2978a6d6-1bf2-4d65-996",
            "reservation_affinity": [],
            "resource_policies": null,
            "scheduling": [
              {
                "automatic_restart": true,
                "availability_domain": 0,
                "instance_termination_action": "",
                "local_ssd_recovery_timeout": [],
                "max_run_duration": [],
                "min_node_cpus": 0,
                "node_affinities": [],
                "on_host_maintenance": "MIGRATE",
                "on_instance_stop_action": [],
                "preemptible": false,
                "provisioning_model": "STANDARD",
                "termination_time": ""
              }
            ],
            "scratch_disk": [],
            "self_link": "https://www.googleapis.com/compute/v1/projects/project-2978a6d6-1bf2-4d65-996/zones/us-east1-b/instances/web-private",
            "service_account": [
              {
                "email": "web-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com",
                "scopes": [
                  "https://www.googleapis.com/auth/logging.write",
                  "https://www.googleapis.com/auth/monitoring.write"
                ]
              }
            ],
            "shielded_instance_config": [
              {
                "enable_integrity_monitoring": true,
                "enable_secure_boot": false,
                "enable_vtpm": true
              }
            ],
            "tags": [
              "web"
            ],
            "tags_fingerprint": "3d9fNIIa_10=",
            "terraform_labels": {
              "goog-terraform-provisioned": "true"
            },
            "timeouts": null,
            "zone": "us-east1-b"
          },
          "sensitive_attributes": [
            [
              {
                "type": "get_attr",
                "value": "boot_disk"
              },
              {
                "type": "index",
                "value": {
                  "value": 0,
                  "type": "number"
                }
              },
              {
                "type": "get_attr",
                "value": "disk_encryption_key_raw"
              }
            ],
            [
              {
                "type": "get_attr",
                "value": "boot_disk"
              },
              {
                "type": "index",
                "value": {
                  "value": 0,
                  "type": "number"
                }
              },
              {
                "type": "get_attr",
                "value": "disk_encryption_key_rsa"
              }
            ]
          ],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiNiJ9",
          "dependencies": [
            "google_compute_network.main",
            "google_compute_subnetwork.private",
            "google_project_service.services",
            "google_service_account.web",
            "tls_private_key.ssh"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "google_compute_network",
      "name": "main",
      "provider": "provider[\"registry.terraform.io/hashicorp/google\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "auto_create_subnetworks": false,
            "bgp_always_compare_med": false,
            "bgp_best_path_selection_mode": "LEGACY",
            "bgp_inter_region_cost": "",
            "delete_default_routes_on_create": false,
            "description": "",
            "enable_ula_internal_ipv6": false,
            "gateway_ipv4": "",
            "id": "projects/project-2978a6d6-1bf2-4d65-996/global/networks/jubilee-gcp-foundation-vpc",
            "internal_ipv6_range": "",
            "mtu": 0,
            "name": "jubilee-gcp-foundation-vpc",
            "network_firewall_policy_enforcement_order": "AFTER_CLASSIC_FIREWALL",
            "network_id": "4328739683444573000",
            "network_profile": "",
            "numeric_id": "4328739683444573000",
            "params": [],
            "project": "project-2978a6d6-1bf2-4d65-996",
            "routing_mode": "REGIONAL",
            "self_link": "https://www.googleapis.com/compute/v1/projects/project-2978a6d6-1bf2-4d65-996/global/networks/jubilee-gcp-foundation-vpc",
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH19",
          "dependencies": [
            "google_project_service.services"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "google_compute_subnetwork",
      "name": "private",
      "provider": "provider[\"registry.terraform.io/hashicorp/google\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "creation_timestamp": "2026-08-06T05:27:42.264-07:00",
            "description": "",
            "enable_flow_logs": false,
            "external_ipv6_prefix": "",
            "fingerprint": null,
            "gateway_address": "10.0.2.1",
            "id": "projects/project-2978a6d6-1bf2-4d65-996/regions/us-east1/subnetworks/private-subnet-a",
            "internal_ipv6_prefix": "",
            "ip_cidr_range": "10.0.2.0/24",
            "ip_collection": null,
            "ipv6_access_type": "",
            "ipv6_cidr_range": "",
            "ipv6_gce_endpoint": "",
            "log_config": [],
            "name": "private-subnet-a",
            "network": "https://www.googleapis.com/compute/v1/projects/project-2978a6d6-1bf2-4d65-996/global/networks/jubilee-gcp-foundation-vpc",
            "params": [],
            "private_ip_google_access": false,
            "private_ipv6_google_access": "DISABLE_GOOGLE_ACCESS",
            "project": "project-2978a6d6-1bf2-4d65-996",
            "purpose": "PRIVATE",
            "region": "us-east1",
            "reserved_internal_range": "",
            "role": "",
            "secondary_ip_range": [],
            "self_link": "https://www.googleapis.com/compute/v1/projects/project-2978a6d6-1bf2-4d65-996/regions/us-east1/subnetworks/private-subnet-a",
            "send_secondary_ip_range_if_empty": null,
            "stack_type": "IPV4_ONLY",
            "state": "",
            "subnetwork_id": 3657840155149583185,
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH19",
          "dependencies": [
            "google_compute_network.main",
            "google_project_service.services"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "google_compute_subnetwork",
      "name": "public",
      "provider": "provider[\"registry.terraform.io/hashicorp/google\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "creation_timestamp": "2026-08-06T05:27:41.818-07:00",
            "description": "",
            "enable_flow_logs": false,
            "external_ipv6_prefix": "",
            "fingerprint": null,
            "gateway_address": "10.0.1.1",
            "id": "projects/project-2978a6d6-1bf2-4d65-996/regions/us-east1/subnetworks/public-subnet-a",
            "internal_ipv6_prefix": "",
            "ip_cidr_range": "10.0.1.0/24",
            "ip_collection": null,
            "ipv6_access_type": "",
            "ipv6_cidr_range": "",
            "ipv6_gce_endpoint": "",
            "log_config": [],
            "name": "public-subnet-a",
            "network": "https://www.googleapis.com/compute/v1/projects/project-2978a6d6-1bf2-4d65-996/global/networks/jubilee-gcp-foundation-vpc",
            "params": [],
            "private_ip_google_access": false,
            "private_ipv6_google_access": "DISABLE_GOOGLE_ACCESS",
            "project": "project-2978a6d6-1bf2-4d65-996",
            "purpose": "PRIVATE",
            "region": "us-east1",
            "reserved_internal_range": "",
            "role": "",
            "secondary_ip_range": [],
            "self_link": "https://www.googleapis.com/compute/v1/projects/project-2978a6d6-1bf2-4d65-996/regions/us-east1/subnetworks/public-subnet-a",
            "send_secondary_ip_range_if_empty": null,
            "stack_type": "IPV4_ONLY",
            "state": "",
            "subnetwork_id": 3655827782582780754,
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH19",
          "dependencies": [
            "google_compute_network.main",
            "google_project_service.services"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "google_monitoring_notification_channel",
      "name": "budget_email",
      "provider": "provider[\"registry.terraform.io/hashicorp/google\"]",
      "instances": [
        {
          "index_key": "ahoosoftwares@gmail.com",
          "schema_version": 0,
          "attributes": {
            "description": "",
            "display_name": "Budget alert - ahoosoftwares@gmail.com",
            "enabled": true,
            "force_delete": false,
            "id": "projects/project-2978a6d6-1bf2-4d65-996/notificationChannels/14939071063469696694",
            "labels": {
              "email_address": "ahoosoftwares@gmail.com"
            },
            "name": "projects/project-2978a6d6-1bf2-4d65-996/notificationChannels/14939071063469696694",
            "project": "project-2978a6d6-1bf2-4d65-996",
            "sensitive_labels": [],
            "timeouts": null,
            "type": "email",
            "user_labels": null,
            "verification_status": ""
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH19",
          "dependencies": [
            "google_project_service.services"
          ]
        },
        {
          "index_key": "ahootech@outlook.com",
          "schema_version": 0,
          "attributes": {
            "description": "",
            "display_name": "Budget alert - ahootech@outlook.com",
            "enabled": true,
            "force_delete": false,
            "id": "projects/project-2978a6d6-1bf2-4d65-996/notificationChannels/14939071063469697243",
            "labels": {
              "email_address": "ahootech@outlook.com"
            },
            "name": "projects/project-2978a6d6-1bf2-4d65-996/notificationChannels/14939071063469697243",
            "project": "project-2978a6d6-1bf2-4d65-996",
            "sensitive_labels": [],
            "timeouts": null,
            "type": "email",
            "user_labels": null,
            "verification_status": ""
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH19",
          "dependencies": [
            "google_project_service.services"
          ]
        },
        {
          "index_key": "harryoduwor@gmail.com",
          "schema_version": 0,
          "attributes": {
            "description": "",
            "display_name": "Budget alert - harryoduwor@gmail.com",
            "enabled": true,
            "force_delete": false,
            "id": "projects/project-2978a6d6-1bf2-4d65-996/notificationChannels/6188100172646656995",
            "labels": {
              "email_address": "harryoduwor@gmail.com"
            },
            "name": "projects/project-2978a6d6-1bf2-4d65-996/notificationChannels/6188100172646656995",
            "project": "project-2978a6d6-1bf2-4d65-996",
            "sensitive_labels": [],
            "timeouts": null,
            "type": "email",
            "user_labels": null,
            "verification_status": ""
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjEyMDAwMDAwMDAwMDAsInVwZGF0ZSI6MTIwMDAwMDAwMDAwMH19",
          "dependencies": [
            "google_project_service.services"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "google_project_iam_member",
      "name": "bastion_logging",
      "provider": "provider[\"registry.terraform.io/hashicorp/google\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "condition": [],
            "etag": "BwZYYAN+9+k=",
            "id": "project-2978a6d6-1bf2-4d65-996/roles/logging.logWriter/serviceAccount:bastion-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com",
            "member": "serviceAccount:bastion-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com",
            "project": "project-2978a6d6-1bf2-4d65-996",
            "role": "roles/logging.logWriter"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "google_project_service.services",
            "google_service_account.bastion"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "google_project_iam_member",
      "name": "bastion_monitoring",
      "provider": "provider[\"registry.terraform.io/hashicorp/google\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "condition": [],
            "etag": "BwZYYAN+9+k=",
            "id": "project-2978a6d6-1bf2-4d65-996/roles/monitoring.metricWriter/serviceAccount:bastion-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com",
            "member": "serviceAccount:bastion-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com",
            "project": "project-2978a6d6-1bf2-4d65-996",
            "role": "roles/monitoring.metricWriter"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "google_project_service.services",
            "google_service_account.bastion"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "google_project_iam_member",
      "name": "human_roles",
      "provider": "provider[\"registry.terraform.io/hashicorp/google\"]",
      "instances": [
        {
          "index_key": "roles/editor-user:ahoosoftware@gmail.com",
          "schema_version": 0,
          "attributes": {
            "condition": [],
            "etag": "BwZYYAKk3GY=",
            "id": "project-2978a6d6-1bf2-4d65-996/roles/editor/user:ahoosoftware@gmail.com",
            "member": "user:ahoosoftware@gmail.com",
            "project": "project-2978a6d6-1bf2-4d65-996",
            "role": "roles/editor"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "google_project_service.services"
          ]
        },
        {
          "index_key": "roles/editor-user:harryoduwor@gmail.com",
          "schema_version": 0,
          "attributes": {
            "condition": [],
            "etag": "BwZYYAKk3GY=",
            "id": "project-2978a6d6-1bf2-4d65-996/roles/editor/user:harryoduwor@gmail.com",
            "member": "user:harryoduwor@gmail.com",
            "project": "project-2978a6d6-1bf2-4d65-996",
            "role": "roles/editor"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "google_project_service.services"
          ]
        },
        {
          "index_key": "roles/resourcemanager.projectIamAdmin-user:harryoduwor@gmail.com",
          "schema_version": 0,
          "attributes": {
            "condition": [],
            "etag": "BwZYYAKk3GY=",
            "id": "project-2978a6d6-1bf2-4d65-996/roles/resourcemanager.projectIamAdmin/user:harryoduwor@gmail.com",
            "member": "user:harryoduwor@gmail.com",
            "project": "project-2978a6d6-1bf2-4d65-996",
            "role": "roles/resourcemanager.projectIamAdmin"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "google_project_service.services"
          ]
        },
        {
          "index_key": "roles/viewer-user:legitimatecomputers@gmail.com",
          "schema_version": 0,
          "attributes": {
            "condition": [],
            "etag": "BwZYYAKk3GY=",
            "id": "project-2978a6d6-1bf2-4d65-996/roles/viewer/user:legitimatecomputers@gmail.com",
            "member": "user:legitimatecomputers@gmail.com",
            "project": "project-2978a6d6-1bf2-4d65-996",
            "role": "roles/viewer"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "google_project_service.services"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "google_project_iam_member",
      "name": "web_logging",
      "provider": "provider[\"registry.terraform.io/hashicorp/google\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "condition": [],
            "etag": "BwZYYAP7hBM=",
            "id": "project-2978a6d6-1bf2-4d65-996/roles/logging.logWriter/serviceAccount:web-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com",
            "member": "serviceAccount:web-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com",
            "project": "project-2978a6d6-1bf2-4d65-996",
            "role": "roles/logging.logWriter"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "google_project_service.services",
            "google_service_account.web"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "google_project_iam_member",
      "name": "web_monitoring",
      "provider": "provider[\"registry.terraform.io/hashicorp/google\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "condition": [],
            "etag": "BwZYYAP7hBM=",
            "id": "project-2978a6d6-1bf2-4d65-996/roles/monitoring.metricWriter/serviceAccount:web-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com",
            "member": "serviceAccount:web-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com",
            "project": "project-2978a6d6-1bf2-4d65-996",
            "role": "roles/monitoring.metricWriter"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "bnVsbA==",
          "dependencies": [
            "google_project_service.services",
            "google_service_account.web"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "google_project_service",
      "name": "services",
      "provider": "provider[\"registry.terraform.io/hashicorp/google\"]",
      "instances": [
        {
          "index_key": "billingbudgets.googleapis.com",
          "schema_version": 0,
          "attributes": {
            "disable_dependent_services": null,
            "disable_on_destroy": false,
            "id": "project-2978a6d6-1bf2-4d65-996/billingbudgets.googleapis.com",
            "project": "project-2978a6d6-1bf2-4d65-996",
            "service": "billingbudgets.googleapis.com",
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjEyMDAwMDAwMDAwMDAsInJlYWQiOjYwMDAwMDAwMDAwMCwidXBkYXRlIjoxMjAwMDAwMDAwMDAwfX0="
        },
        {
          "index_key": "cloudresourcemanager.googleapis.com",
          "schema_version": 0,
          "attributes": {
            "disable_dependent_services": null,
            "disable_on_destroy": false,
            "id": "project-2978a6d6-1bf2-4d65-996/cloudresourcemanager.googleapis.com",
            "project": "project-2978a6d6-1bf2-4d65-996",
            "service": "cloudresourcemanager.googleapis.com",
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjEyMDAwMDAwMDAwMDAsInJlYWQiOjYwMDAwMDAwMDAwMCwidXBkYXRlIjoxMjAwMDAwMDAwMDAwfX0="
        },
        {
          "index_key": "compute.googleapis.com",
          "schema_version": 0,
          "attributes": {
            "disable_dependent_services": null,
            "disable_on_destroy": false,
            "id": "project-2978a6d6-1bf2-4d65-996/compute.googleapis.com",
            "project": "project-2978a6d6-1bf2-4d65-996",
            "service": "compute.googleapis.com",
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjEyMDAwMDAwMDAwMDAsInJlYWQiOjYwMDAwMDAwMDAwMCwidXBkYXRlIjoxMjAwMDAwMDAwMDAwfX0="
        },
        {
          "index_key": "iam.googleapis.com",
          "schema_version": 0,
          "attributes": {
            "disable_dependent_services": null,
            "disable_on_destroy": false,
            "id": "project-2978a6d6-1bf2-4d65-996/iam.googleapis.com",
            "project": "project-2978a6d6-1bf2-4d65-996",
            "service": "iam.googleapis.com",
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjEyMDAwMDAwMDAwMDAsInJlYWQiOjYwMDAwMDAwMDAwMCwidXBkYXRlIjoxMjAwMDAwMDAwMDAwfX0="
        },
        {
          "index_key": "monitoring.googleapis.com",
          "schema_version": 0,
          "attributes": {
            "disable_dependent_services": null,
            "disable_on_destroy": false,
            "id": "project-2978a6d6-1bf2-4d65-996/monitoring.googleapis.com",
            "project": "project-2978a6d6-1bf2-4d65-996",
            "service": "monitoring.googleapis.com",
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjEyMDAwMDAwMDAwMDAsInJlYWQiOjYwMDAwMDAwMDAwMCwidXBkYXRlIjoxMjAwMDAwMDAwMDAwfX0="
        }
      ]
    },
    {
      "mode": "managed",
      "type": "google_service_account",
      "name": "bastion",
      "provider": "provider[\"registry.terraform.io/hashicorp/google\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "account_id": "bastion-sa",
            "create_ignore_already_exists": null,
            "description": "",
            "disabled": false,
            "display_name": "Bastion Service Account",
            "email": "bastion-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com",
            "id": "projects/project-2978a6d6-1bf2-4d65-996/serviceAccounts/bastion-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com",
            "member": "serviceAccount:bastion-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com",
            "name": "projects/project-2978a6d6-1bf2-4d65-996/serviceAccounts/bastion-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com",
            "project": "project-2978a6d6-1bf2-4d65-996",
            "timeouts": null,
            "unique_id": "117008546688008072679"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDB9fQ==",
          "dependencies": [
            "google_project_service.services"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "google_service_account",
      "name": "web",
      "provider": "provider[\"registry.terraform.io/hashicorp/google\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "account_id": "web-sa",
            "create_ignore_already_exists": null,
            "description": "",
            "disabled": false,
            "display_name": "Private Web Service Account",
            "email": "web-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com",
            "id": "projects/project-2978a6d6-1bf2-4d65-996/serviceAccounts/web-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com",
            "member": "serviceAccount:web-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com",
            "name": "projects/project-2978a6d6-1bf2-4d65-996/serviceAccounts/web-sa@project-2978a6d6-1bf2-4d65-996.iam.gserviceaccount.com",
            "project": "project-2978a6d6-1bf2-4d65-996",
            "timeouts": null,
            "unique_id": "108451189034191170188"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDB9fQ==",
          "dependencies": [
            "google_project_service.services"
          ]
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
          "schema_version": 0,
          "attributes": {
            "content": "-----BEGIN RSA PRIVATE KEY-----\nMIIJKAIBAAKCAgEAnUaZe1nAE5npm6QjKe0jbG1Ct3Q9l3Gw1kh5i3TvQnLuozo5\nqsRTGl5UB842WcHYVpaD3HLemMvnvS8zzPQrRdC1SGU9Pu2NfL5PCBwe7LF1k2lw\nXQDbznsdIfhYewU8kOnVcQ+vrkQGPQ+J7w+Tgfc6MV/TVNoqDCSWemLqB/wdxYMJ\nZys4AOFyhlC7FeT3GrvvlXGbKeXXC+NrVcZCJ/02GS76sJFUaxQVr6y7Uir+KPMj\nxNnEwdu36t5m/HjrJPKb+XcLamvjmtYsE4ZC4akipx2NaZ4EZ2MK9T1Oj+Y3BJFi\nvn8rL1/OJucMhnNlKlZKo340W4rVN2x9WA/JX4lf6o9t2z7ULIp18cllEYUJHu1U\nBUoYs9xcT6hdZQQrTXmhoRn2mfUZ52qaZ37ClaVYbep2LGBPiqOrMaGzKynHsLys\nmxsP/xJlF1NtZq/lUZkkiSpcvV2iYLpBLj/IMqOtkl4NsY/MJ7yVem6rDwdM25a0\n3Jhgw+J1WFJ2u7/8/DHBqEK4R1B3FMhWa8m6Y8z16g6oJcYKRVAUVCQGb29xuKnZ\nHDunNzT+Mxg2cg3JDwykLH05BbSYfMAM7uq5ucSPwfceH1aMzxGqJlWQt2WRk4e4\nYkQw9xoHlzK1opxSq2uXwc6d6JBiBP0Twb0eGXM/eo7IeqADDZmuGC07dScCAwEA\nAQKCAgBKUrM0ThENkkYJxbLSXNzJIAcPv/BdUZ5SXVSG+T8aBUtNurXGw9lL1Djc\nqXAY0ZjFLoLo2iXkSjPcvOI7YEXUy9DngeRECSm8QgkCGZvpmeEoxQKTCNVXCeoW\nBBD4LdzV1JMHx3Rro3zZPS8fWJqKKAWJkLHDXwfQzjeIZZcYJ+X/0TFP3mYsUF35\nKEyJB7dYnGiXlGTRk2qhFRtDoRnhYPFATGmuqDcfFRI8fyHUrjmGq4QDQjAPtp/+\n75P2isQApV/dL4snAw4/vSd+IIwZrP6Rv870kvaczvq+Mvcd3JqyX2ws/tavIBTB\nYJ2UKhMsQzQpd/oRKpYhB3VieK9d51y67aZBUp8h8VcJPAQnAsETzxHA1XSy5R/2\nI1ne2owasNcph5jGnT0lqxuXis26aRqyqRliDSOocuLZp/UQX+/gbFpZiUGPcXgU\nFJH+pkfL/D0l0f/iuA9zTMCiNMzS6k8DzOcV4Txa6AZaw6TO0RjW8SkkFLf9rgHD\nNG63PYNrdpu58K2gAUhWZIEHTEwmMULm8nppL1hcdHrT+1TzOaTKzQXrjApcnEcI\n2ZOmAxPRD369mY1oizfiGqViscX/DoD9Np+YTpsdDmDMXvcapS32D+BblLD09vd3\nlZf21sjpEPZe+0Zu9o316c99QNRYPIg2yRP2Y9CpLjTEjn0tvQKCAQEAyU/mNkug\nv5MXGhU69hCH1aysmVEH2zzfmMushYAlR4UVdXNO1wxiHjSF4sT2j3NPfukXBgOl\n/zRtm7XZBnRLPshOyraHHkKUhIpizqFoYp2uyw4GHiKN6jikljLrUmyztDoIq9Vl\nojl6VwHYxM3z+RHjo19qA+NbLiUW7C59B9SRxce3qv3HcLECvMJEBop3jZiMtgMU\nr+dsS5rjcAfsOmdI9Wqcp2UQGaTJukCtYbIZUVft5I5Ea+dtwDhOuqZ6oBEjo/XL\nV0qtEt4mbjw8RosNi/G84QO4ZNPSosu8IcUTl66gJLWSiD1OaVM+FP7SYYQYP8XM\nFcSiAP4KpHA2zQKCAQEAyAA6BiRqQjb/r/ndXW8nZlS1i6YuT9g8FeFgboKFOrFT\nhYxQdh6tFVFzVVOnA/jlvNpxalBRurLXk4ST65J0/4YhfVsLDzbGuR9FSGrw9mfE\nfyWu++3mwrxSLI/YxcNq33L1VwXY56o+CPeY5tMHo8OM4tSFmNMj0wnXI68rwnKY\nKC13EEprlP9NZmnn2PsTH3hG2wyd6Tf7Mbx8S3SdnKdwnIhy27KNOAbWiMTwz3gj\nHPcv82oaLLqFOgkDK8Z7e9133M6520PWn1sCtB9t5cIbwEhXzZAmT8JXoQxtet+X\no4KRe+d7klaHMMKRXgV8xAlpajhJYAiPPX+WaXKTwwKCAQBGkFclmQTTof9rCR4N\numWipFArvZd/ZasKp/nlIbHvi9qlvLFZ9+E8rTRw9JFoXwbyeUm0tfqtpfb1qZxV\nAtaNPzE/JRPfq37bppZTz4gDaTonutayIXKVMx2d+GM8FRY4ik8XzEk/v93+OYt+\nEKMAHyEn1v4WNs9zMVUDnJf+8qfWJ9ddfG84NRO8jmvBzy9w1pQcCKBruDbhmX03\ne891+VY9kA0xL9+g3X5IZvtfT0pIlQWyI5wgJpL12cbe7hP1n4xaoIGSK37XKj9W\nTI7kO0GYWDfYt7EexpECt19OhwIDHRbNR0gBsVuW17LfMSMVQ3QshmyvBKm0p1eb\npCnRAoIBAQCuUUxBiEG5Hriyh6SCSFxd2500b45T91M/euWSzF4U7vOuJcMHgOs4\n9noAt92NH8YVWYuarxDdGf29TMOkgk1JXX4ZBV5ZT1PbjD7VxKfrDDx+2bhvSkZk\nGsHAp0u36wBea5Mc2zLXkFFrfWqeXPZ+rPVByxv6PKUvzpbeOlJ4s2qdMithXovw\nHKk4hzwVqZhcSHfxeki0Oh/NlMv89FJfdK05MdByXmipmYQpRwXgvoRUPbpkfWj8\n7UEreSlzYRbFuh07rk7dpn4M/MUZe39Mz2diq2sj9uz9fZTlALD3dKR1Vls5VGQn\nAxXn0N3kxgGd19oyQ4bole1LG8ZceAoDAoIBAHQK863SKskYs9HcRTW2IYbvPBZb\nISB0WyqVr0SM3q+knNhSsSnHM8jSqDPU+A1Kf3icBMXw/HMut31QMwb1p1XvIpfo\nRfVGEyoR1fAEIvm4yyUhgO+O5ydmVn11SI9wuGuhZl3ws09TZkMSUbNwxwJhUqiR\nj70UKkIt4cAf7T/XtBrI2N7/g5dw76vRDi4upftk6If8KBL/776wZxgPO4al1Pql\nNyJlkIhGt7OJ2dRNzLzUepx6/sWfwRcdvLt27zGXyF7RFl5d3tT9iWtK8/Y/uhqT\niGiLFZGlmvP/r4a77FYxjdzEIkqh/AdAl/6nV+UfvMwBNTeX7mtwUE1N4VE=\n-----END RSA PRIVATE KEY-----\n",
            "content_base64": null,
            "content_base64sha256": "GMludKwqxlT+rgDgR0SbnLKUXgoTiqiM77GhKbG1KSw=",
            "content_base64sha512": "QoGRLIZQmF+/prk8G2A/pIZpSY03P+o7+MnBYqr706QNh5OwxlrpIjNpWM9B5xOUmNdrJBzQExXL8q2fxlJtPw==",
            "content_md5": "2e0eca8013ff81912d3b267c09bd7104",
            "content_sha1": "68172b3efc55c576330c72ff0c32166a83a5206c",
            "content_sha256": "18c96e74ac2ac654feae00e047449b9cb2945e0a138aa88cefb1a129b1b5292c",
            "content_sha512": "4281912c8650985fbfa6b93c1b603fa48669498d373fea3bf8c9c162aafbd3a40d8793b0c65ae922336958cf41e7139498d76b241cd01315cbf2ad9fc6526d3f",
            "directory_permission": "0777",
            "file_permission": "0600",
            "filename": "./jubilee-gcp-foundation-key.pem",
            "id": "68172b3efc55c576330c72ff0c32166a83a5206c",
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
          "schema_version": 1,
          "attributes": {
            "algorithm": "RSA",
            "ecdsa_curve": "P224",
            "id": "e35b473cb01966e374e7de8e95ecc33c12a88754",
            "private_key_openssh": "-----BEGIN OPENSSH PRIVATE KEY-----\nb3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAACFwAAAAdz\nc2gtcnNhAAAAAwEAAQAAAgEAnUaZe1nAE5npm6QjKe0jbG1Ct3Q9l3Gw1kh5i3Tv\nQnLuozo5qsRTGl5UB842WcHYVpaD3HLemMvnvS8zzPQrRdC1SGU9Pu2NfL5PCBwe\n7LF1k2lwXQDbznsdIfhYewU8kOnVcQ+vrkQGPQ+J7w+Tgfc6MV/TVNoqDCSWemLq\nB/wdxYMJZys4AOFyhlC7FeT3GrvvlXGbKeXXC+NrVcZCJ/02GS76sJFUaxQVr6y7\nUir+KPMjxNnEwdu36t5m/HjrJPKb+XcLamvjmtYsE4ZC4akipx2NaZ4EZ2MK9T1O\nj+Y3BJFivn8rL1/OJucMhnNlKlZKo340W4rVN2x9WA/JX4lf6o9t2z7ULIp18cll\nEYUJHu1UBUoYs9xcT6hdZQQrTXmhoRn2mfUZ52qaZ37ClaVYbep2LGBPiqOrMaGz\nKynHsLysmxsP/xJlF1NtZq/lUZkkiSpcvV2iYLpBLj/IMqOtkl4NsY/MJ7yVem6r\nDwdM25a03Jhgw+J1WFJ2u7/8/DHBqEK4R1B3FMhWa8m6Y8z16g6oJcYKRVAUVCQG\nb29xuKnZHDunNzT+Mxg2cg3JDwykLH05BbSYfMAM7uq5ucSPwfceH1aMzxGqJlWQ\nt2WRk4e4YkQw9xoHlzK1opxSq2uXwc6d6JBiBP0Twb0eGXM/eo7IeqADDZmuGC07\ndScAAAc4HInkLByJ5CwAAAAHc3NoLXJzYQAAAgEAnUaZe1nAE5npm6QjKe0jbG1C\nt3Q9l3Gw1kh5i3TvQnLuozo5qsRTGl5UB842WcHYVpaD3HLemMvnvS8zzPQrRdC1\nSGU9Pu2NfL5PCBwe7LF1k2lwXQDbznsdIfhYewU8kOnVcQ+vrkQGPQ+J7w+Tgfc6\nMV/TVNoqDCSWemLqB/wdxYMJZys4AOFyhlC7FeT3GrvvlXGbKeXXC+NrVcZCJ/02\nGS76sJFUaxQVr6y7Uir+KPMjxNnEwdu36t5m/HjrJPKb+XcLamvjmtYsE4ZC4aki\npx2NaZ4EZ2MK9T1Oj+Y3BJFivn8rL1/OJucMhnNlKlZKo340W4rVN2x9WA/JX4lf\n6o9t2z7ULIp18cllEYUJHu1UBUoYs9xcT6hdZQQrTXmhoRn2mfUZ52qaZ37ClaVY\nbep2LGBPiqOrMaGzKynHsLysmxsP/xJlF1NtZq/lUZkkiSpcvV2iYLpBLj/IMqOt\nkl4NsY/MJ7yVem6rDwdM25a03Jhgw+J1WFJ2u7/8/DHBqEK4R1B3FMhWa8m6Y8z1\n6g6oJcYKRVAUVCQGb29xuKnZHDunNzT+Mxg2cg3JDwykLH05BbSYfMAM7uq5ucSP\nwfceH1aMzxGqJlWQt2WRk4e4YkQw9xoHlzK1opxSq2uXwc6d6JBiBP0Twb0eGXM/\neo7IeqADDZmuGC07dScAAAADAQABAAACAEpSszROEQ2SRgnFstJc3MkgBw+/8F1R\nnlJdVIb5PxoFS026tcbD2UvUONypcBjRmMUugujaJeRKM9y84jtgRdTL0OeB5EQJ\nKbxCCQIZm+mZ4SjFApMI1VcJ6hYEEPgt3NXUkwfHdGujfNk9Lx9YmoooBYmQscNf\nB9DON4hllxgn5f/RMU/eZixQXfkoTIkHt1icaJeUZNGTaqEVG0OhGeFg8UBMaa6o\nNx8VEjx/IdSuOYarhANCMA+2n/7vk/aKxAClX90viycDDj+9J34gjBms/pG/zvSS\n9pzO+r4y9x3cmrJfbCz+1q8gFMFgnZQqEyxDNCl3+hEqliEHdWJ4r13nXLrtpkFS\nnyHxVwk8BCcCwRPPEcDVdLLlH/YjWd7ajBqw1ymHmMadPSWrG5eKzbppGrKpGWIN\nI6hy4tmn9RBf7+BsWlmJQY9xeBQUkf6mR8v8PSXR/+K4D3NMwKI0zNLqTwPM5xXh\nPFroBlrDpM7RGNbxKSQUt/2uAcM0brc9g2t2m7nwraABSFZkgQdMTCYxQubyemkv\nWFx0etP7VPM5pMrNBeuMClycRwjZk6YDE9EPfr2ZjWiLN+IapWKxxf8OgP02n5hO\nmx0OYMxe9xqlLfYP4FuUsPT293eVl/bWyOkQ9l77Rm72jfXpz31A1Fg8iDbJE/Zj\n0KkuNMSOfS29AAABAHQK863SKskYs9HcRTW2IYbvPBZbISB0WyqVr0SM3q+knNhS\nsSnHM8jSqDPU+A1Kf3icBMXw/HMut31QMwb1p1XvIpfoRfVGEyoR1fAEIvm4yyUh\ngO+O5ydmVn11SI9wuGuhZl3ws09TZkMSUbNwxwJhUqiRj70UKkIt4cAf7T/XtBrI\n2N7/g5dw76vRDi4upftk6If8KBL/776wZxgPO4al1PqlNyJlkIhGt7OJ2dRNzLzU\nepx6/sWfwRcdvLt27zGXyF7RFl5d3tT9iWtK8/Y/uhqTiGiLFZGlmvP/r4a77FYx\njdzEIkqh/AdAl/6nV+UfvMwBNTeX7mtwUE1N4VEAAAEBAMlP5jZLoL+TFxoVOvYQ\nh9WsrJlRB9s835jLrIWAJUeFFXVzTtcMYh40heLE9o9zT37pFwYDpf80bZu12QZ0\nSz7ITsq2hx5ClISKYs6haGKdrssOBh4ijeo4pJYy61Jss7Q6CKvVZaI5elcB2MTN\n8/kR46NfagPjWy4lFuwufQfUkcXHt6r9x3CxArzCRAaKd42YjLYDFK/nbEua43AH\n7DpnSPVqnKdlEBmkybpArWGyGVFX7eSORGvnbcA4TrqmeqARI6P1y1dKrRLeJm48\nPEaLDYvxvOEDuGTT0qLLvCHFE5euoCS1kog9TmlTPhT+0mGEGD/FzBXEogD+CqRw\nNs0AAAEBAMgAOgYkakI2/6/53V1vJ2ZUtYumLk/YPBXhYG6ChTqxU4WMUHYerRVR\nc1VTpwP45bzacWpQUbqy15OEk+uSdP+GIX1bCw82xrkfRUhq8PZnxH8lrvvt5sK8\nUiyP2MXDat9y9VcF2OeqPgj3mObTB6PDjOLUhZjTI9MJ1yOvK8JymCgtdxBKa5T/\nTWZp59j7Ex94RtsMnek3+zG8fEt0nZyncJyIctuyjTgG1ojE8M94Ixz3L/NqGiy6\nhToJAyvGe3vdd9zOudtD1p9bArQfbeXCG8BIV82QJk/CV6EMbXrfl6OCkXvne5JW\nhzDCkV4FfMQJaWo4SWAIjz1/lmlyk8MAAAAAAQID\n-----END OPENSSH PRIVATE KEY-----\n",
            "private_key_pem": "-----BEGIN RSA PRIVATE KEY-----\nMIIJKAIBAAKCAgEAnUaZe1nAE5npm6QjKe0jbG1Ct3Q9l3Gw1kh5i3TvQnLuozo5\nqsRTGl5UB842WcHYVpaD3HLemMvnvS8zzPQrRdC1SGU9Pu2NfL5PCBwe7LF1k2lw\nXQDbznsdIfhYewU8kOnVcQ+vrkQGPQ+J7w+Tgfc6MV/TVNoqDCSWemLqB/wdxYMJ\nZys4AOFyhlC7FeT3GrvvlXGbKeXXC+NrVcZCJ/02GS76sJFUaxQVr6y7Uir+KPMj\nxNnEwdu36t5m/HjrJPKb+XcLamvjmtYsE4ZC4akipx2NaZ4EZ2MK9T1Oj+Y3BJFi\nvn8rL1/OJucMhnNlKlZKo340W4rVN2x9WA/JX4lf6o9t2z7ULIp18cllEYUJHu1U\nBUoYs9xcT6hdZQQrTXmhoRn2mfUZ52qaZ37ClaVYbep2LGBPiqOrMaGzKynHsLys\nmxsP/xJlF1NtZq/lUZkkiSpcvV2iYLpBLj/IMqOtkl4NsY/MJ7yVem6rDwdM25a0\n3Jhgw+J1WFJ2u7/8/DHBqEK4R1B3FMhWa8m6Y8z16g6oJcYKRVAUVCQGb29xuKnZ\nHDunNzT+Mxg2cg3JDwykLH05BbSYfMAM7uq5ucSPwfceH1aMzxGqJlWQt2WRk4e4\nYkQw9xoHlzK1opxSq2uXwc6d6JBiBP0Twb0eGXM/eo7IeqADDZmuGC07dScCAwEA\nAQKCAgBKUrM0ThENkkYJxbLSXNzJIAcPv/BdUZ5SXVSG+T8aBUtNurXGw9lL1Djc\nqXAY0ZjFLoLo2iXkSjPcvOI7YEXUy9DngeRECSm8QgkCGZvpmeEoxQKTCNVXCeoW\nBBD4LdzV1JMHx3Rro3zZPS8fWJqKKAWJkLHDXwfQzjeIZZcYJ+X/0TFP3mYsUF35\nKEyJB7dYnGiXlGTRk2qhFRtDoRnhYPFATGmuqDcfFRI8fyHUrjmGq4QDQjAPtp/+\n75P2isQApV/dL4snAw4/vSd+IIwZrP6Rv870kvaczvq+Mvcd3JqyX2ws/tavIBTB\nYJ2UKhMsQzQpd/oRKpYhB3VieK9d51y67aZBUp8h8VcJPAQnAsETzxHA1XSy5R/2\nI1ne2owasNcph5jGnT0lqxuXis26aRqyqRliDSOocuLZp/UQX+/gbFpZiUGPcXgU\nFJH+pkfL/D0l0f/iuA9zTMCiNMzS6k8DzOcV4Txa6AZaw6TO0RjW8SkkFLf9rgHD\nNG63PYNrdpu58K2gAUhWZIEHTEwmMULm8nppL1hcdHrT+1TzOaTKzQXrjApcnEcI\n2ZOmAxPRD369mY1oizfiGqViscX/DoD9Np+YTpsdDmDMXvcapS32D+BblLD09vd3\nlZf21sjpEPZe+0Zu9o316c99QNRYPIg2yRP2Y9CpLjTEjn0tvQKCAQEAyU/mNkug\nv5MXGhU69hCH1aysmVEH2zzfmMushYAlR4UVdXNO1wxiHjSF4sT2j3NPfukXBgOl\n/zRtm7XZBnRLPshOyraHHkKUhIpizqFoYp2uyw4GHiKN6jikljLrUmyztDoIq9Vl\nojl6VwHYxM3z+RHjo19qA+NbLiUW7C59B9SRxce3qv3HcLECvMJEBop3jZiMtgMU\nr+dsS5rjcAfsOmdI9Wqcp2UQGaTJukCtYbIZUVft5I5Ea+dtwDhOuqZ6oBEjo/XL\nV0qtEt4mbjw8RosNi/G84QO4ZNPSosu8IcUTl66gJLWSiD1OaVM+FP7SYYQYP8XM\nFcSiAP4KpHA2zQKCAQEAyAA6BiRqQjb/r/ndXW8nZlS1i6YuT9g8FeFgboKFOrFT\nhYxQdh6tFVFzVVOnA/jlvNpxalBRurLXk4ST65J0/4YhfVsLDzbGuR9FSGrw9mfE\nfyWu++3mwrxSLI/YxcNq33L1VwXY56o+CPeY5tMHo8OM4tSFmNMj0wnXI68rwnKY\nKC13EEprlP9NZmnn2PsTH3hG2wyd6Tf7Mbx8S3SdnKdwnIhy27KNOAbWiMTwz3gj\nHPcv82oaLLqFOgkDK8Z7e9133M6520PWn1sCtB9t5cIbwEhXzZAmT8JXoQxtet+X\no4KRe+d7klaHMMKRXgV8xAlpajhJYAiPPX+WaXKTwwKCAQBGkFclmQTTof9rCR4N\numWipFArvZd/ZasKp/nlIbHvi9qlvLFZ9+E8rTRw9JFoXwbyeUm0tfqtpfb1qZxV\nAtaNPzE/JRPfq37bppZTz4gDaTonutayIXKVMx2d+GM8FRY4ik8XzEk/v93+OYt+\nEKMAHyEn1v4WNs9zMVUDnJf+8qfWJ9ddfG84NRO8jmvBzy9w1pQcCKBruDbhmX03\ne891+VY9kA0xL9+g3X5IZvtfT0pIlQWyI5wgJpL12cbe7hP1n4xaoIGSK37XKj9W\nTI7kO0GYWDfYt7EexpECt19OhwIDHRbNR0gBsVuW17LfMSMVQ3QshmyvBKm0p1eb\npCnRAoIBAQCuUUxBiEG5Hriyh6SCSFxd2500b45T91M/euWSzF4U7vOuJcMHgOs4\n9noAt92NH8YVWYuarxDdGf29TMOkgk1JXX4ZBV5ZT1PbjD7VxKfrDDx+2bhvSkZk\nGsHAp0u36wBea5Mc2zLXkFFrfWqeXPZ+rPVByxv6PKUvzpbeOlJ4s2qdMithXovw\nHKk4hzwVqZhcSHfxeki0Oh/NlMv89FJfdK05MdByXmipmYQpRwXgvoRUPbpkfWj8\n7UEreSlzYRbFuh07rk7dpn4M/MUZe39Mz2diq2sj9uz9fZTlALD3dKR1Vls5VGQn\nAxXn0N3kxgGd19oyQ4bole1LG8ZceAoDAoIBAHQK863SKskYs9HcRTW2IYbvPBZb\nISB0WyqVr0SM3q+knNhSsSnHM8jSqDPU+A1Kf3icBMXw/HMut31QMwb1p1XvIpfo\nRfVGEyoR1fAEIvm4yyUhgO+O5ydmVn11SI9wuGuhZl3ws09TZkMSUbNwxwJhUqiR\nj70UKkIt4cAf7T/XtBrI2N7/g5dw76vRDi4upftk6If8KBL/776wZxgPO4al1Pql\nNyJlkIhGt7OJ2dRNzLzUepx6/sWfwRcdvLt27zGXyF7RFl5d3tT9iWtK8/Y/uhqT\niGiLFZGlmvP/r4a77FYxjdzEIkqh/AdAl/6nV+UfvMwBNTeX7mtwUE1N4VE=\n-----END RSA PRIVATE KEY-----\n",
            "private_key_pem_pkcs8": "-----BEGIN PRIVATE KEY-----\nMIIJQgIBADANBgkqhkiG9w0BAQEFAASCCSwwggkoAgEAAoICAQCdRpl7WcATmemb\npCMp7SNsbUK3dD2XcbDWSHmLdO9Ccu6jOjmqxFMaXlQHzjZZwdhWloPcct6Yy+e9\nLzPM9CtF0LVIZT0+7Y18vk8IHB7ssXWTaXBdANvOex0h+Fh7BTyQ6dVxD6+uRAY9\nD4nvD5OB9zoxX9NU2ioMJJZ6YuoH/B3FgwlnKzgA4XKGULsV5Pcau++VcZsp5dcL\n42tVxkIn/TYZLvqwkVRrFBWvrLtSKv4o8yPE2cTB27fq3mb8eOsk8pv5dwtqa+Oa\n1iwThkLhqSKnHY1pngRnYwr1PU6P5jcEkWK+fysvX84m5wyGc2UqVkqjfjRbitU3\nbH1YD8lfiV/qj23bPtQsinXxyWURhQke7VQFShiz3FxPqF1lBCtNeaGhGfaZ9Rnn\nappnfsKVpVht6nYsYE+Ko6sxobMrKcewvKybGw//EmUXU21mr+VRmSSJKly9XaJg\nukEuP8gyo62SXg2xj8wnvJV6bqsPB0zblrTcmGDD4nVYUna7v/z8McGoQrhHUHcU\nyFZrybpjzPXqDqglxgpFUBRUJAZvb3G4qdkcO6c3NP4zGDZyDckPDKQsfTkFtJh8\nwAzu6rm5xI/B9x4fVozPEaomVZC3ZZGTh7hiRDD3GgeXMrWinFKra5fBzp3okGIE\n/RPBvR4Zcz96jsh6oAMNma4YLTt1JwIDAQABAoICAEpSszROEQ2SRgnFstJc3Mkg\nBw+/8F1RnlJdVIb5PxoFS026tcbD2UvUONypcBjRmMUugujaJeRKM9y84jtgRdTL\n0OeB5EQJKbxCCQIZm+mZ4SjFApMI1VcJ6hYEEPgt3NXUkwfHdGujfNk9Lx9Ymooo\nBYmQscNfB9DON4hllxgn5f/RMU/eZixQXfkoTIkHt1icaJeUZNGTaqEVG0OhGeFg\n8UBMaa6oNx8VEjx/IdSuOYarhANCMA+2n/7vk/aKxAClX90viycDDj+9J34gjBms\n/pG/zvSS9pzO+r4y9x3cmrJfbCz+1q8gFMFgnZQqEyxDNCl3+hEqliEHdWJ4r13n\nXLrtpkFSnyHxVwk8BCcCwRPPEcDVdLLlH/YjWd7ajBqw1ymHmMadPSWrG5eKzbpp\nGrKpGWINI6hy4tmn9RBf7+BsWlmJQY9xeBQUkf6mR8v8PSXR/+K4D3NMwKI0zNLq\nTwPM5xXhPFroBlrDpM7RGNbxKSQUt/2uAcM0brc9g2t2m7nwraABSFZkgQdMTCYx\nQubyemkvWFx0etP7VPM5pMrNBeuMClycRwjZk6YDE9EPfr2ZjWiLN+IapWKxxf8O\ngP02n5hOmx0OYMxe9xqlLfYP4FuUsPT293eVl/bWyOkQ9l77Rm72jfXpz31A1Fg8\niDbJE/Zj0KkuNMSOfS29AoIBAQDJT+Y2S6C/kxcaFTr2EIfVrKyZUQfbPN+Yy6yF\ngCVHhRV1c07XDGIeNIXixPaPc09+6RcGA6X/NG2btdkGdEs+yE7KtoceQpSEimLO\noWhina7LDgYeIo3qOKSWMutSbLO0Ogir1WWiOXpXAdjEzfP5EeOjX2oD41suJRbs\nLn0H1JHFx7eq/cdwsQK8wkQGineNmIy2AxSv52xLmuNwB+w6Z0j1apynZRAZpMm6\nQK1hshlRV+3kjkRr523AOE66pnqgESOj9ctXSq0S3iZuPDxGiw2L8bzhA7hk09Ki\ny7whxROXrqAktZKIPU5pUz4U/tJhhBg/xcwVxKIA/gqkcDbNAoIBAQDIADoGJGpC\nNv+v+d1dbydmVLWLpi5P2DwV4WBugoU6sVOFjFB2Hq0VUXNVU6cD+OW82nFqUFG6\nsteThJPrknT/hiF9WwsPNsa5H0VIavD2Z8R/Ja777ebCvFIsj9jFw2rfcvVXBdjn\nqj4I95jm0wejw4zi1IWY0yPTCdcjryvCcpgoLXcQSmuU/01maefY+xMfeEbbDJ3p\nN/sxvHxLdJ2cp3CciHLbso04BtaIxPDPeCMc9y/zahosuoU6CQMrxnt73Xfczrnb\nQ9afWwK0H23lwhvASFfNkCZPwlehDG1635ejgpF753uSVocwwpFeBXzECWlqOElg\nCI89f5ZpcpPDAoIBAEaQVyWZBNOh/2sJHg26ZaKkUCu9l39lqwqn+eUhse+L2qW8\nsVn34TytNHD0kWhfBvJ5SbS1+q2l9vWpnFUC1o0/MT8lE9+rftumllPPiANpOie6\n1rIhcpUzHZ34YzwVFjiKTxfMST+/3f45i34QowAfISfW/hY2z3MxVQOcl/7yp9Yn\n1118bzg1E7yOa8HPL3DWlBwIoGu4NuGZfTd7z3X5Vj2QDTEv36Ddfkhm+19PSkiV\nBbIjnCAmkvXZxt7uE/WfjFqggZIrftcqP1ZMjuQ7QZhYN9i3sR7GkQK3X06HAgMd\nFs1HSAGxW5bXst8xIxVDdCyGbK8EqbSnV5ukKdECggEBAK5RTEGIQbkeuLKHpIJI\nXF3bnTRvjlP3Uz965ZLMXhTu864lwweA6zj2egC33Y0fxhVZi5qvEN0Z/b1Mw6SC\nTUldfhkFXllPU9uMPtXEp+sMPH7ZuG9KRmQawcCnS7frAF5rkxzbMteQUWt9ap5c\n9n6s9UHLG/o8pS/Olt46Unizap0yK2Fei/AcqTiHPBWpmFxId/F6SLQ6H82Uy/z0\nUl90rTkx0HJeaKmZhClHBeC+hFQ9umR9aPztQSt5KXNhFsW6HTuuTt2mfgz8xRl7\nf0zPZ2KrayP27P19lOUAsPd0pHVWWzlUZCcDFefQ3eTGAZ3X2jJDhuiV7Usbxlx4\nCgMCggEAdArzrdIqyRiz0dxFNbYhhu88FlshIHRbKpWvRIzer6Sc2FKxKcczyNKo\nM9T4DUp/eJwExfD8cy63fVAzBvWnVe8il+hF9UYTKhHV8AQi+bjLJSGA747nJ2ZW\nfXVIj3C4a6FmXfCzT1NmQxJRs3DHAmFSqJGPvRQqQi3hwB/tP9e0GsjY3v+Dl3Dv\nq9EOLi6l+2Toh/woEv/vvrBnGA87hqXU+qU3ImWQiEa3s4nZ1E3MvNR6nHr+xZ/B\nFx28u3bvMZfIXtEWXl3e1P2Ja0rz9j+6GpOIaIsVkaWa8/+vhrvsVjGN3MQiSqH8\nB0CX/qdX5R+8zAE1N5fua3BQTU3hUQ==\n-----END PRIVATE KEY-----\n",
            "public_key_fingerprint_md5": "1b:b9:5c:a2:98:98:c4:ad:e9:a5:4d:9a:ff:bf:1b:77",
            "public_key_fingerprint_sha256": "SHA256:uPEM4PtmsiQarcK/uLmPWKnuwihEkEFzTL4/gThoS5E",
            "public_key_openssh": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCdRpl7WcATmembpCMp7SNsbUK3dD2XcbDWSHmLdO9Ccu6jOjmqxFMaXlQHzjZZwdhWloPcct6Yy+e9LzPM9CtF0LVIZT0+7Y18vk8IHB7ssXWTaXBdANvOex0h+Fh7BTyQ6dVxD6+uRAY9D4nvD5OB9zoxX9NU2ioMJJZ6YuoH/B3FgwlnKzgA4XKGULsV5Pcau++VcZsp5dcL42tVxkIn/TYZLvqwkVRrFBWvrLtSKv4o8yPE2cTB27fq3mb8eOsk8pv5dwtqa+Oa1iwThkLhqSKnHY1pngRnYwr1PU6P5jcEkWK+fysvX84m5wyGc2UqVkqjfjRbitU3bH1YD8lfiV/qj23bPtQsinXxyWURhQke7VQFShiz3FxPqF1lBCtNeaGhGfaZ9RnnappnfsKVpVht6nYsYE+Ko6sxobMrKcewvKybGw//EmUXU21mr+VRmSSJKly9XaJgukEuP8gyo62SXg2xj8wnvJV6bqsPB0zblrTcmGDD4nVYUna7v/z8McGoQrhHUHcUyFZrybpjzPXqDqglxgpFUBRUJAZvb3G4qdkcO6c3NP4zGDZyDckPDKQsfTkFtJh8wAzu6rm5xI/B9x4fVozPEaomVZC3ZZGTh7hiRDD3GgeXMrWinFKra5fBzp3okGIE/RPBvR4Zcz96jsh6oAMNma4YLTt1Jw==\n",
            "public_key_pem": "-----BEGIN PUBLIC KEY-----\nMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAnUaZe1nAE5npm6QjKe0j\nbG1Ct3Q9l3Gw1kh5i3TvQnLuozo5qsRTGl5UB842WcHYVpaD3HLemMvnvS8zzPQr\nRdC1SGU9Pu2NfL5PCBwe7LF1k2lwXQDbznsdIfhYewU8kOnVcQ+vrkQGPQ+J7w+T\ngfc6MV/TVNoqDCSWemLqB/wdxYMJZys4AOFyhlC7FeT3GrvvlXGbKeXXC+NrVcZC\nJ/02GS76sJFUaxQVr6y7Uir+KPMjxNnEwdu36t5m/HjrJPKb+XcLamvjmtYsE4ZC\n4akipx2NaZ4EZ2MK9T1Oj+Y3BJFivn8rL1/OJucMhnNlKlZKo340W4rVN2x9WA/J\nX4lf6o9t2z7ULIp18cllEYUJHu1UBUoYs9xcT6hdZQQrTXmhoRn2mfUZ52qaZ37C\nlaVYbep2LGBPiqOrMaGzKynHsLysmxsP/xJlF1NtZq/lUZkkiSpcvV2iYLpBLj/I\nMqOtkl4NsY/MJ7yVem6rDwdM25a03Jhgw+J1WFJ2u7/8/DHBqEK4R1B3FMhWa8m6\nY8z16g6oJcYKRVAUVCQGb29xuKnZHDunNzT+Mxg2cg3JDwykLH05BbSYfMAM7uq5\nucSPwfceH1aMzxGqJlWQt2WRk4e4YkQw9xoHlzK1opxSq2uXwc6d6JBiBP0Twb0e\nGXM/eo7IeqADDZmuGC07dScCAwEAAQ==\n-----END PUBLIC KEY-----\n",
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
    },
    {
      "object_kind": "var",
      "config_addr": "var.billing_account_id",
      "status": "pass",
      "objects": [
        {
          "object_addr": "var.billing_account_id",
          "status": "pass"
        }
      ]
    },
    {
      "object_kind": "var",
      "config_addr": "var.billing_alert_emails",
      "status": "pass",
      "objects": [
        {
          "object_addr": "var.billing_alert_emails",
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
project_id = "project-2978a6d6-1bf2-4d65-996"

project = "jubilee-gcp-foundation"

region = "us-east1"

zone = "us-east1-b"

machine_type = "e2-micro"

network_cidr = "10.0.0.0/16"

public_subnet_cidr = "10.0.1.0/24"

private_subnet_cidr = "10.0.2.0/24"

# Replace with your real public IP.
# Example:
# my_ip = "197.232.10.55/32"
my_ip = "41.139.243.97/32"

# Required for the mandatory budget.
# Get billing account ID with:
# gcloud billing accounts list
billing_account_id = "01FA5C-32C9B9-EB5D46"

monthly_budget_limit = 5

billing_alert_emails = [
  "ahoosoftwares@gmail.com",
  "ahootech@outlook.com",
  "harryoduwor@gmail.com"
]


admin_members = [
  "user:harryoduwor@gmail.com"
]

engineer_members = [
  "user:ahoosoftware@gmail.com"
]

auditor_members = [
  "user:legitimatecomputers@gmail.com"
]


# admin_members    = []
# engineer_members = []
# auditor_members  = []


```


<div style='page-break-after: always;'></div>

# File: terraform-sa.json

```json
```


<div style='page-break-after: always;'></div>

# File: variables.tf

```tf
variable "project_id" {
  description = "Existing GCP project ID where resources will be created"
  type        = string
}

variable "project" {
  description = "Project naming prefix"
  type        = string
  default     = "jubilee-gcp-foundation"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "GCP zone inside the region"
  type        = string
  default     = "us-central1-a"
}

variable "machine_type" {
  description = "GCP VM machine type"
  type        = string
  default     = "e2-micro"
}

variable "network_cidr" {
  description = "VPC CIDR range"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "Public subnet CIDR range"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "Private subnet CIDR range"
  type        = string
  default     = "10.0.2.0/24"
}

variable "my_ip" {
  description = "Your public IP address in CIDR format, example: 197.232.10.55/32"
  type        = string

  validation {
    condition     = can(cidrhost(var.my_ip, 0))
    error_message = "The my_ip value must be a valid CIDR block, for example: 197.232.10.55/32."
  }
}

variable "billing_account_id" {
  description = "GCP billing account ID. Required for budget creation."
  type        = string

  validation {
    condition     = length(trimspace(var.billing_account_id)) > 0
    error_message = "billing_account_id is required because the budget is mandatory in this implementation."
  }
}

variable "monthly_budget_limit" {
  description = "Monthly budget limit in USD"
  type        = number
  default     = 5
}

variable "billing_alert_emails" {
  description = "Email addresses to receive budget alerts"
  type        = list(string)

  validation {
    condition     = length(var.billing_alert_emails) > 0
    error_message = "At least one billing alert email address is required."
  }
}


variable "admin_members" {
  description = "Gmail accounts for Project Administrators"
  type        = list(string)
  default     = []
}

variable "engineer_members" {
  description = "Gmail accounts for Engineer (Editor) role"
  type        = list(string)
  default     = []
}

variable "auditor_members" {
  description = "Gmail accounts for Auditor (Viewer) role"
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
    <p>This web server is running in a private GCP subnet.</p>
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

