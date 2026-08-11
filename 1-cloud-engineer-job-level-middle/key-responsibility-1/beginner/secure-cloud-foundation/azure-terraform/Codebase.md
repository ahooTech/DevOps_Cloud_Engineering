# Staff Canteen Management System

Generated: 08/10/2026 23:18:28

---

## Table of Contents

- .terraform.lock.hcl
- .terraform\providers\registry.terraform.io\hashicorp\azuread\2.53.1\windows_amd64\LICENSE.txt
- .terraform\providers\registry.terraform.io\hashicorp\azurerm\3.117.1\windows_amd64\LICENSE.txt
- .terraform\providers\registry.terraform.io\hashicorp\local\2.9.0\windows_amd64\LICENSE.txt
- .terraform\providers\registry.terraform.io\hashicorp\random\3.9.0\windows_amd64\LICENSE.txt
- .terraform\providers\registry.terraform.io\hashicorp\tls\4.3.0\windows_amd64\LICENSE.txt
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

provider "registry.terraform.io/hashicorp/azuread" {
  version     = "2.53.1"
  constraints = "~> 2.0"
  hashes = [
    "h1:7ZNdNGnUB6N6Z6St3COzRXFaghMEyYkZt7WyOCRKOqo=",
    "zh:162916b037e5133f49298b0ffa3e7dcef7d76530a8ca738e7293373980f73c68",
    "zh:1c3e89cf19118fc07d7b04257251fc9897e722c16e0a0df7b07fcd261f8c12e7",
    "zh:492931cea4f30887ab5bca36a8556dfcb897288eddd44619c0217fc5da2d57e7",
    "zh:4c895e450e18335ad8714cc6d3488fc1a78816ad2851a91b06cb2ef775dd7c66",
    "zh:60d92fdaf7235574201f2d8f68f733ee00a822993b3fc95e6952e09e6ec76999",
    "zh:67a169119efa41c1fb867ef1a8e79bf03472a2324384c36eb55370c817dcce42",
    "zh:9dd4d5ed9233cf9329262200bc5a1aa60942b80dbc611e2ef4b09f47531b39b1",
    "zh:a3c160e35b9e40fc1497b83c2f37a8e24565b05a1783c7733609f3695735c2a9",
    "zh:a4a221da42b1f46e7c436c7145e5beaadfd9d03f3be6fd526d132c03f18a5979",
    "zh:af0d3476a9702d2287e168e3baa670e64daab9c9b01c01e17025a5248f3e28e9",
    "zh:e3579bff7894f3d36066b74ec324be6d28f56a42a387a2b8a0eabf33cbff86df",
    "zh:f1749ee8ad972ae6424665aa9d2c0ece8c40c51d41ec2f38b863148cb437e865",
  ]
}

provider "registry.terraform.io/hashicorp/azurerm" {
  version     = "3.117.1"
  constraints = "~> 3.0"
  hashes = [
    "h1:Y9J+emydHX7LpJYKdF9Zmng0zcRR86Awm/t28LNzb68=",
    "zh:0c513676836e3c50d004ece7d2624a8aff6faac14b833b96feeac2e4bc2c1c12",
    "zh:50ea01ada95bae2f187db9e926e463f45d860767a85ebc59160414e00e76c35d",
    "zh:52c2a9edacc06b3f72153f5ef6daca0761c6292158815961fe37f60bc576a3d7",
    "zh:618eed2a06b19b1a025b45b05891846d570a6a1cca4d23f4942f5a99e1f747ae",
    "zh:61cde5d3165d7e5ec311d5d89486819cd605c1b2d54611b5c97bd4e97dba2762",
    "zh:6a873358d5031fc222f5e05f029d1237f3dce8345c767665f393283dfa2627f6",
    "zh:afdd80064b2a04da311856feb4ed45f77ff4df6c356e8c2b10afb51fe7e61c70",
    "zh:b09113df7e0e8c8959539bd22bae6c39faeb269ba3c4cd948e742f5cf58c35fb",
    "zh:d340db7973109761cfc27d52aa02560363337c908b2c99b3628adc5a70a99d5b",
    "zh:d5a577226ebc8c65e8f19384878a86acc4b51ede4b4a82d37c3b331b0efcd4a7",
    "zh:e2962b147f9e71732df8dbc74940c10d20906f3c003cbfaa1eb9fabbf601a9f0",
    "zh:f569b65999264a9416862bca5cd2a6177d94ccb0424f3a4ef424428912b9cb3c",
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
  version = "3.9.0"
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

# File: .terraform\providers\registry.terraform.io\hashicorp\azuread\2.53.1\windows_amd64\LICENSE.txt

```txt
Copyright (c) 2019 HashiCorp, Inc.

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

# File: .terraform\providers\registry.terraform.io\hashicorp\azurerm\3.117.1\windows_amd64\LICENSE.txt

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
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.0"
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

provider "azurerm" {
  features {}
}

provider "azuread" {}

locals {
  web_user_data = file("${path.module}/web_user_data.sh")
}

###############################################################
# Resource Group (The Azure "Folder")
###############################################################
resource "azurerm_resource_group" "main" {
  name     = "${var.project}-rg"
  location = var.azure_region
  tags     = var.default_tags
}

###############################################################
# Networking (VNet & Subnets)
###############################################################
resource "azurerm_virtual_network" "main" {
  name                = "${var.project}-vnet"
  address_space       = [var.vpc_cidr]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tags                = var.default_tags
}

resource "azurerm_subnet" "public" {
  name                 = "public-subnet-a"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.public_subnet_cidr]
}

resource "azurerm_subnet" "private" {
  name                 = "private-subnet-a"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.private_subnet_cidr]
}

###############################################################
# Network Security Groups (Azure Firewalls)
###############################################################
resource "azurerm_network_security_group" "bastion" {
  name                = "${var.project}-bastion-nsg"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tags                = var.default_tags
}

resource "azurerm_network_security_rule" "bastion_ssh" {
  name                        = "AllowSSH"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = var.my_ip
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.bastion.name
}

resource "azurerm_network_security_group" "web" {
  name                = "${var.project}-web-nsg"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tags                = var.default_tags
}

resource "azurerm_network_security_rule" "web_http" {
  name                   = "AllowHTTPFromBastion"
  priority               = 100
  direction              = "Inbound"
  access                 = "Allow"
  protocol               = "Tcp"
  source_port_range      = "*"
  destination_port_range = "80"
  # Only allow traffic originating from the Public Subnet (Bastion)
  source_address_prefix       = var.public_subnet_cidr
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.web.name
}

# Attach NSGs to Subnets
resource "azurerm_subnet_network_security_group_association" "public" {
  subnet_id                 = azurerm_subnet.public.id
  network_security_group_id = azurerm_network_security_group.bastion.id
}

resource "azurerm_subnet_network_security_group_association" "private" {
  subnet_id                 = azurerm_subnet.private.id
  network_security_group_id = azurerm_network_security_group.web.id
}

###############################################################
# SSH Key Generation
###############################################################
resource "tls_private_key" "ssh" {
  count     = var.create_new_key ? 1 : 0
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "ssh_private_key" {
  count           = var.create_new_key ? 1 : 0
  filename        = "${path.module}/${var.project}-key.pem"
  content         = tls_private_key.ssh[0].private_key_openssh
  file_permission = "0600"
}

###############################################################
# Public IP & Network Interfaces (NICs)
###############################################################
resource "azurerm_public_ip" "bastion" {
  name                = "${var.project}-bastion-pip"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = [var.availability_zone]

  tags = var.default_tags
}

resource "azurerm_network_interface" "bastion" {
  name                = "${var.project}-bastion-nic"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tags                = var.default_tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.public.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.bastion.id
  }
}

resource "azurerm_network_interface" "web" {
  name                = "${var.project}-web-nic"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tags                = var.default_tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.private.id
    private_ip_address_allocation = "Dynamic"
  }
}

###############################################################
# Virtual Machines (Ubuntu)
###############################################################
resource "azurerm_linux_virtual_machine" "bastion" {
  name                  = "bastion-vm"
  resource_group_name   = azurerm_resource_group.main.name
  location              = azurerm_resource_group.main.location
  size                  = var.instance_type
  admin_username        = "azureuser"
  zone                  = var.availability_zone
  network_interface_ids = [azurerm_network_interface.bastion.id]
  tags                  = var.default_tags

  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.ssh[0].public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}

resource "azurerm_linux_virtual_machine" "web_private" {
  name                  = "web-private-vm"
  resource_group_name   = azurerm_resource_group.main.name
  location              = azurerm_resource_group.main.location
  size                  = var.instance_type
  admin_username        = "azureuser"
  zone                  = var.availability_zone
  network_interface_ids = [azurerm_network_interface.web.id]
  tags                  = var.default_tags
  custom_data           = base64encode(local.web_user_data)

  admin_ssh_key {
    username   = "azureuser"
    public_key = tls_private_key.ssh[0].public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}

###############################################################
# Azure RBAC (Identity & Access Management)
###############################################################
resource "azuread_group" "admins" {
  display_name     = "Cloud-Admins"
  security_enabled = true
}

resource "azuread_group" "engineers" {
  display_name     = "Cloud-Engineers"
  security_enabled = true
}

resource "azuread_group" "auditors" {
  display_name     = "Cloud-Auditors"
  security_enabled = true
}

# Assign Azure Roles to the Groups at the Resource Group level
resource "azurerm_role_assignment" "admins" {
  scope                = azurerm_resource_group.main.id
  role_definition_name = "Owner"
  principal_id         = azuread_group.admins.object_id
}

resource "azurerm_role_assignment" "engineers" {
  scope                = azurerm_resource_group.main.id
  role_definition_name = "Contributor"
  principal_id         = azuread_group.engineers.object_id
}

resource "azurerm_role_assignment" "auditors" {
  scope                = azurerm_resource_group.main.id
  role_definition_name = "Reader"
  principal_id         = azuread_group.auditors.object_id
}


###############################################################
# Optional Entra ID Users
###############################################################

locals {
  entra_users = var.create_entra_users ? {
    "admin.lab" = {
      display_name = "Lab Admin"
      group_id     = azuread_group.admins.object_id
    }

    "engineer.lab" = {
      display_name = "Lab Engineer"
      group_id     = azuread_group.engineers.object_id
    }

    "auditor.lab" = {
      display_name = "Lab Auditor"
      group_id     = azuread_group.auditors.object_id
    }
  } : {}
}

resource "random_password" "entra_users" {
  for_each = local.entra_users

  length           = 16
  special          = true
  override_special = "!@#$%^&*()-_=+[]{}"
}

resource "azuread_user" "this" {
  for_each = local.entra_users

  user_principal_name = "${each.key}@${var.entra_domain_name}"
  display_name        = each.value.display_name
  mail_nickname       = replace(each.key, ".", "-")
  password            = random_password.entra_users[each.key].result

  force_password_change = true
}

resource "azuread_group_member" "this" {
  for_each = local.entra_users

  group_object_id  = each.value.group_id
  member_object_id = azuread_user.this[each.key].object_id
}

###############################################################
# Cost Governance (Azure Budgets)
###############################################################
resource "azurerm_consumption_budget_resource_group" "learning" {
  count = var.create_budget ? 1 : 0

  name              = "${var.project}-learning-budget"
  resource_group_id = azurerm_resource_group.main.id

  amount     = var.monthly_budget_limit
  time_grain = "Monthly"

  time_period {
    start_date = formatdate("YYYY-MM-01'T'00:00:00Z", timestamp())
    end_date   = timeadd(formatdate("YYYY-MM-01'T'00:00:00Z", timestamp()), "8760h")
  }

  notification {
    enabled        = true
    threshold      = 80.0
    operator       = "GreaterThan"
    threshold_type = "Actual"
    contact_emails = var.billing_alert_emails
  }
}
```


<div style='page-break-after: always;'></div>

# File: outputs.tf

```tf
output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "bastion_public_ip" {
  value = azurerm_public_ip.bastion.ip_address
}

output "web_private_ip" {
  value = azurerm_network_interface.web.private_ip_address
}

output "ssh_command" {
  value = "ssh -i ./${var.project}-key.pem azureuser@${azurerm_public_ip.bastion.ip_address}"
}

output "entra_user_passwords" {
  description = "Generated Entra ID user passwords"
  value = {
    for username, user in azuread_user.this :
    username => random_password.entra_users[username].result
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
  "serial": 190,
  "lineage": "7718401f-93e7-9f2e-6731-65d2153867f6",
  "outputs": {},
  "resources": [],
  "check_results": null
}

```


<div style='page-break-after: always;'></div>

# File: terraform.tfstate.backup

```backup
{
  "version": 4,
  "terraform_version": "1.15.2",
  "serial": 156,
  "lineage": "7718401f-93e7-9f2e-6731-65d2153867f6",
  "outputs": {
    "bastion_public_ip": {
      "value": "40.76.121.197",
      "type": "string"
    },
    "entra_user_passwords": {
      "value": {
        "admin.lab": "uDcO+W84Z\u0026(FS1O]",
        "auditor.lab": "gG^kbKKQSwj8bCGi",
        "engineer.lab": "*D}*0q_nV3\u0026jIAPu"
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
    "resource_group_name": {
      "value": "jubilee-azure-foundation-rg",
      "type": "string"
    },
    "ssh_command": {
      "value": "ssh -i ./jubilee-azure-foundation-key.pem azureuser@40.76.121.197",
      "type": "string"
    },
    "web_private_ip": {
      "value": "10.0.2.4",
      "type": "string"
    }
  },
  "resources": [
    {
      "mode": "managed",
      "type": "azuread_group",
      "name": "admins",
      "provider": "provider[\"registry.terraform.io/hashicorp/azuread\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "administrative_unit_ids": null,
            "assignable_to_role": false,
            "auto_subscribe_new_members": false,
            "behaviors": null,
            "description": "",
            "display_name": "Cloud-Admins",
            "dynamic_membership": [],
            "external_senders_allowed": false,
            "hide_from_address_lists": false,
            "hide_from_outlook_clients": false,
            "id": "289844c5-3cc2-45ef-85c6-286663143b3d",
            "mail": "",
            "mail_enabled": false,
            "mail_nickname": "9ed45f33-d",
            "members": [],
            "object_id": "289844c5-3cc2-45ef-85c6-286663143b3d",
            "onpremises_domain_name": "",
            "onpremises_group_type": "",
            "onpremises_netbios_name": "",
            "onpremises_sam_account_name": "",
            "onpremises_security_identifier": "",
            "onpremises_sync_enabled": false,
            "owners": [
              "803a7bc5-5b8f-415a-bd42-de183b49f17b"
            ],
            "preferred_language": "",
            "prevent_duplicate_names": false,
            "provisioning_options": null,
            "proxy_addresses": [],
            "security_enabled": true,
            "theme": "",
            "timeouts": null,
            "types": null,
            "visibility": "",
            "writeback_enabled": false
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjMwMDAwMDAwMDAwMCwicmVhZCI6MzAwMDAwMDAwMDAwLCJ1cGRhdGUiOjEyMDAwMDAwMDAwMDB9fQ=="
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azuread_group",
      "name": "auditors",
      "provider": "provider[\"registry.terraform.io/hashicorp/azuread\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "administrative_unit_ids": null,
            "assignable_to_role": false,
            "auto_subscribe_new_members": false,
            "behaviors": null,
            "description": "",
            "display_name": "Cloud-Auditors",
            "dynamic_membership": [],
            "external_senders_allowed": false,
            "hide_from_address_lists": false,
            "hide_from_outlook_clients": false,
            "id": "fab88f76-cdbe-4662-be03-cc38edb0def1",
            "mail": "",
            "mail_enabled": false,
            "mail_nickname": "143d5b7e-7",
            "members": [],
            "object_id": "fab88f76-cdbe-4662-be03-cc38edb0def1",
            "onpremises_domain_name": "",
            "onpremises_group_type": "",
            "onpremises_netbios_name": "",
            "onpremises_sam_account_name": "",
            "onpremises_security_identifier": "",
            "onpremises_sync_enabled": false,
            "owners": [
              "803a7bc5-5b8f-415a-bd42-de183b49f17b"
            ],
            "preferred_language": "",
            "prevent_duplicate_names": false,
            "provisioning_options": null,
            "proxy_addresses": [],
            "security_enabled": true,
            "theme": "",
            "timeouts": null,
            "types": null,
            "visibility": "",
            "writeback_enabled": false
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjMwMDAwMDAwMDAwMCwicmVhZCI6MzAwMDAwMDAwMDAwLCJ1cGRhdGUiOjEyMDAwMDAwMDAwMDB9fQ=="
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azuread_group",
      "name": "engineers",
      "provider": "provider[\"registry.terraform.io/hashicorp/azuread\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "administrative_unit_ids": null,
            "assignable_to_role": false,
            "auto_subscribe_new_members": false,
            "behaviors": null,
            "description": "",
            "display_name": "Cloud-Engineers",
            "dynamic_membership": [],
            "external_senders_allowed": false,
            "hide_from_address_lists": false,
            "hide_from_outlook_clients": false,
            "id": "0ebb4a99-2895-4846-b1e5-042d7edccf13",
            "mail": "",
            "mail_enabled": false,
            "mail_nickname": "926981d9-5",
            "members": [],
            "object_id": "0ebb4a99-2895-4846-b1e5-042d7edccf13",
            "onpremises_domain_name": "",
            "onpremises_group_type": "",
            "onpremises_netbios_name": "",
            "onpremises_sam_account_name": "",
            "onpremises_security_identifier": "",
            "onpremises_sync_enabled": false,
            "owners": [
              "803a7bc5-5b8f-415a-bd42-de183b49f17b"
            ],
            "preferred_language": "",
            "prevent_duplicate_names": false,
            "provisioning_options": null,
            "proxy_addresses": [],
            "security_enabled": true,
            "theme": "",
            "timeouts": null,
            "types": null,
            "visibility": "",
            "writeback_enabled": false
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxMjAwMDAwMDAwMDAwLCJkZWxldGUiOjMwMDAwMDAwMDAwMCwicmVhZCI6MzAwMDAwMDAwMDAwLCJ1cGRhdGUiOjEyMDAwMDAwMDAwMDB9fQ=="
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azuread_group_member",
      "name": "this",
      "provider": "provider[\"registry.terraform.io/hashicorp/azuread\"]",
      "instances": [
        {
          "index_key": "admin.lab",
          "schema_version": 0,
          "attributes": {
            "group_object_id": "289844c5-3cc2-45ef-85c6-286663143b3d",
            "id": "289844c5-3cc2-45ef-85c6-286663143b3d/member/e1169f5f-68f6-42da-8eab-35d9cf2e1363",
            "member_object_id": "e1169f5f-68f6-42da-8eab-35d9cf2e1363",
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDAsImRlbGV0ZSI6MzAwMDAwMDAwMDAwLCJyZWFkIjozMDAwMDAwMDAwMDB9fQ==",
          "dependencies": [
            "azuread_group.admins",
            "azuread_group.auditors",
            "azuread_group.engineers",
            "azuread_user.this",
            "random_password.entra_users"
          ]
        },
        {
          "index_key": "auditor.lab",
          "schema_version": 0,
          "attributes": {
            "group_object_id": "fab88f76-cdbe-4662-be03-cc38edb0def1",
            "id": "fab88f76-cdbe-4662-be03-cc38edb0def1/member/f400fc0a-8603-4d7b-9264-d8527a642662",
            "member_object_id": "f400fc0a-8603-4d7b-9264-d8527a642662",
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDAsImRlbGV0ZSI6MzAwMDAwMDAwMDAwLCJyZWFkIjozMDAwMDAwMDAwMDB9fQ==",
          "dependencies": [
            "azuread_group.admins",
            "azuread_group.auditors",
            "azuread_group.engineers",
            "azuread_user.this",
            "random_password.entra_users"
          ]
        },
        {
          "index_key": "engineer.lab",
          "schema_version": 0,
          "attributes": {
            "group_object_id": "0ebb4a99-2895-4846-b1e5-042d7edccf13",
            "id": "0ebb4a99-2895-4846-b1e5-042d7edccf13/member/998f0098-2601-4f94-ba15-dfacf9e7b256",
            "member_object_id": "998f0098-2601-4f94-ba15-dfacf9e7b256",
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDAsImRlbGV0ZSI6MzAwMDAwMDAwMDAwLCJyZWFkIjozMDAwMDAwMDAwMDB9fQ==",
          "dependencies": [
            "azuread_group.admins",
            "azuread_group.auditors",
            "azuread_group.engineers",
            "azuread_user.this",
            "random_password.entra_users"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azuread_user",
      "name": "this",
      "provider": "provider[\"registry.terraform.io/hashicorp/azuread\"]",
      "instances": [
        {
          "index_key": "admin.lab",
          "schema_version": 0,
          "attributes": {
            "about_me": "",
            "account_enabled": true,
            "age_group": "",
            "business_phones": [],
            "city": "",
            "company_name": "",
            "consent_provided_for_minor": "",
            "cost_center": "",
            "country": "",
            "creation_type": "",
            "department": "",
            "disable_password_expiration": false,
            "disable_strong_password": false,
            "display_name": "Lab Admin",
            "division": "",
            "employee_id": "",
            "employee_type": "",
            "external_user_state": "",
            "fax_number": "",
            "force_password_change": true,
            "given_name": "",
            "id": "e1169f5f-68f6-42da-8eab-35d9cf2e1363",
            "im_addresses": [],
            "job_title": "",
            "mail": "",
            "mail_nickname": "admin-lab",
            "manager_id": "",
            "mobile_phone": "",
            "object_id": "e1169f5f-68f6-42da-8eab-35d9cf2e1363",
            "office_location": "",
            "onpremises_distinguished_name": "",
            "onpremises_domain_name": "",
            "onpremises_immutable_id": "",
            "onpremises_sam_account_name": "",
            "onpremises_security_identifier": "",
            "onpremises_sync_enabled": false,
            "onpremises_user_principal_name": "",
            "other_mails": null,
            "password": "uDcO+W84Z\u0026(FS1O]",
            "postal_code": "",
            "preferred_language": "",
            "proxy_addresses": [],
            "show_in_address_list": true,
            "state": "",
            "street_address": "",
            "surname": "",
            "timeouts": null,
            "usage_location": "",
            "user_principal_name": "admin.lab@ahootechoutlook.onmicrosoft.com",
            "user_type": "Member"
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
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDAsImRlbGV0ZSI6MzAwMDAwMDAwMDAwLCJyZWFkIjozMDAwMDAwMDAwMDAsInVwZGF0ZSI6MzAwMDAwMDAwMDAwfX0=",
          "dependencies": [
            "azuread_group.admins",
            "azuread_group.auditors",
            "azuread_group.engineers",
            "random_password.entra_users"
          ]
        },
        {
          "index_key": "auditor.lab",
          "schema_version": 0,
          "attributes": {
            "about_me": "",
            "account_enabled": true,
            "age_group": "",
            "business_phones": [],
            "city": "",
            "company_name": "",
            "consent_provided_for_minor": "",
            "cost_center": "",
            "country": "",
            "creation_type": "",
            "department": "",
            "disable_password_expiration": false,
            "disable_strong_password": false,
            "display_name": "Lab Auditor",
            "division": "",
            "employee_id": "",
            "employee_type": "",
            "external_user_state": "",
            "fax_number": "",
            "force_password_change": true,
            "given_name": "",
            "id": "f400fc0a-8603-4d7b-9264-d8527a642662",
            "im_addresses": [],
            "job_title": "",
            "mail": "",
            "mail_nickname": "auditor-lab",
            "manager_id": "",
            "mobile_phone": "",
            "object_id": "f400fc0a-8603-4d7b-9264-d8527a642662",
            "office_location": "",
            "onpremises_distinguished_name": "",
            "onpremises_domain_name": "",
            "onpremises_immutable_id": "",
            "onpremises_sam_account_name": "",
            "onpremises_security_identifier": "",
            "onpremises_sync_enabled": false,
            "onpremises_user_principal_name": "",
            "other_mails": null,
            "password": "gG^kbKKQSwj8bCGi",
            "postal_code": "",
            "preferred_language": "",
            "proxy_addresses": [],
            "show_in_address_list": true,
            "state": "",
            "street_address": "",
            "surname": "",
            "timeouts": null,
            "usage_location": "",
            "user_principal_name": "auditor.lab@ahootechoutlook.onmicrosoft.com",
            "user_type": "Member"
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
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDAsImRlbGV0ZSI6MzAwMDAwMDAwMDAwLCJyZWFkIjozMDAwMDAwMDAwMDAsInVwZGF0ZSI6MzAwMDAwMDAwMDAwfX0=",
          "dependencies": [
            "azuread_group.admins",
            "azuread_group.auditors",
            "azuread_group.engineers",
            "random_password.entra_users"
          ]
        },
        {
          "index_key": "engineer.lab",
          "schema_version": 0,
          "attributes": {
            "about_me": "",
            "account_enabled": true,
            "age_group": "",
            "business_phones": [],
            "city": "",
            "company_name": "",
            "consent_provided_for_minor": "",
            "cost_center": "",
            "country": "",
            "creation_type": "",
            "department": "",
            "disable_password_expiration": false,
            "disable_strong_password": false,
            "display_name": "Lab Engineer",
            "division": "",
            "employee_id": "",
            "employee_type": "",
            "external_user_state": "",
            "fax_number": "",
            "force_password_change": true,
            "given_name": "",
            "id": "998f0098-2601-4f94-ba15-dfacf9e7b256",
            "im_addresses": [],
            "job_title": "",
            "mail": "",
            "mail_nickname": "engineer-lab",
            "manager_id": "",
            "mobile_phone": "",
            "object_id": "998f0098-2601-4f94-ba15-dfacf9e7b256",
            "office_location": "",
            "onpremises_distinguished_name": "",
            "onpremises_domain_name": "",
            "onpremises_immutable_id": "",
            "onpremises_sam_account_name": "",
            "onpremises_security_identifier": "",
            "onpremises_sync_enabled": false,
            "onpremises_user_principal_name": "",
            "other_mails": null,
            "password": "*D}*0q_nV3\u0026jIAPu",
            "postal_code": "",
            "preferred_language": "",
            "proxy_addresses": [],
            "show_in_address_list": true,
            "state": "",
            "street_address": "",
            "surname": "",
            "timeouts": null,
            "usage_location": "",
            "user_principal_name": "engineer.lab@ahootechoutlook.onmicrosoft.com",
            "user_type": "Member"
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
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjozMDAwMDAwMDAwMDAsImRlbGV0ZSI6MzAwMDAwMDAwMDAwLCJyZWFkIjozMDAwMDAwMDAwMDAsInVwZGF0ZSI6MzAwMDAwMDAwMDAwfX0=",
          "dependencies": [
            "azuread_group.admins",
            "azuread_group.auditors",
            "azuread_group.engineers",
            "random_password.entra_users"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azurerm_consumption_budget_resource_group",
      "name": "learning",
      "provider": "provider[\"registry.terraform.io/hashicorp/azurerm\"]",
      "instances": [
        {
          "index_key": 0,
          "schema_version": 0,
          "attributes": {
            "amount": 5,
            "etag": "\"1dd2599f3d137e3\"",
            "filter": [],
            "id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Consumption/budgets/jubilee-azure-foundation-learning-budget",
            "name": "jubilee-azure-foundation-learning-budget",
            "notification": [
              {
                "contact_emails": [
                  "ahoosoftwares@gmail.com",
                  "ahootech@outlook.com",
                  "harryoduwor@gmail.com"
                ],
                "contact_groups": [],
                "contact_roles": [],
                "enabled": true,
                "operator": "GreaterThan",
                "threshold": 80,
                "threshold_type": "Actual"
              }
            ],
            "resource_group_id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg",
            "time_grain": "Monthly",
            "time_period": [
              {
                "end_date": "2027-08-01T00:00:00Z",
                "start_date": "2026-08-01T00:00:00Z"
              }
            ],
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxODAwMDAwMDAwMDAwLCJkZWxldGUiOjE4MDAwMDAwMDAwMDAsInJlYWQiOjMwMDAwMDAwMDAwMCwidXBkYXRlIjoxODAwMDAwMDAwMDAwfX0=",
          "dependencies": [
            "azurerm_resource_group.main"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azurerm_linux_virtual_machine",
      "name": "bastion",
      "provider": "provider[\"registry.terraform.io/hashicorp/azurerm\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "additional_capabilities": [],
            "admin_password": null,
            "admin_ssh_key": [
              {
                "public_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC03WFBa9gOXiLXLJpS0hCNiY9w2cjG4p3EB3dlbZ1gN+QPy6W7wDcdDuZgHzLXsryMlfWhrQ0zFa2KcbbXlkN+lC6TUntEfq3Lhw1KDpIVAK1Klqx72MOhVmWbJp1e6+LMLT94eByugR4sc9rgNwUrvdzP8aUgg8lg0IqpBNmb9l7Kf2ac1JEvxYHn2pWY0CJgU4vtzz1DCumnd/6lppMxLwL6zJ5htKfNxWF39PKWYfZRCQL54MAwhJcfvIk4uMHTmE4Mqf29WF5RcGc1oc7yzedaOlkf64SsE/3AmThqsVffV2RyMpP9XLmJHLcH3/+BaKzOe3yAiNG1B8689yCczEH5YjmlkQiGxWXMi8ZEB25qzW69hzP4Ev4C+KH5OW93qYjOIHzY37Fk6quj3+s/3ntTlvxpSVWxuNtqc1dpGmgEPRkQkYff+xk0FlIqZla774PnWfl46flxLsbfjduYHX5kkqaY7hI3gJNHOlNNRqSYw1Ag+BWNLyOhufD2sT5lip0IZntNDYfe8im+BnKB8QBCK3x4WY1aD8h+AOWlSLV2wAnpxrdabEUdGjEByC3R7gZjY04k5vXJ3scl82HV5PSkXsUupnxh4y0Ge5S/7IkxBbxnZAyPiWPuvTc3gIKDCwz1Qj/EotdGyK4Yqd1OJVSgpf2xw/YcjT75KJ/9Cw==\n",
                "username": "azureuser"
              }
            ],
            "admin_username": "azureuser",
            "allow_extension_operations": true,
            "availability_set_id": "",
            "boot_diagnostics": [],
            "bypass_platform_safety_checks_on_user_schedule_enabled": false,
            "capacity_reservation_group_id": "",
            "computer_name": "bastion-vm",
            "custom_data": null,
            "dedicated_host_group_id": "",
            "dedicated_host_id": "",
            "disable_password_authentication": true,
            "disk_controller_type": "SCSI",
            "edge_zone": "",
            "encryption_at_host_enabled": false,
            "eviction_policy": "",
            "extensions_time_budget": "PT1H30M",
            "gallery_application": [],
            "id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Compute/virtualMachines/bastion-vm",
            "identity": [],
            "license_type": "",
            "location": "eastus",
            "max_bid_price": -1,
            "name": "bastion-vm",
            "network_interface_ids": [
              "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Network/networkInterfaces/jubilee-azure-foundation-bastion-nic"
            ],
            "os_disk": [
              {
                "caching": "ReadWrite",
                "diff_disk_settings": [],
                "disk_encryption_set_id": "",
                "disk_size_gb": 30,
                "name": "bastion-vm_OsDisk_1_254035f1aaac463fb1d5b2b7d42d6e0b",
                "secure_vm_disk_encryption_set_id": "",
                "security_encryption_type": "",
                "storage_account_type": "Standard_LRS",
                "write_accelerator_enabled": false
              }
            ],
            "os_image_notification": [],
            "patch_assessment_mode": "ImageDefault",
            "patch_mode": "ImageDefault",
            "plan": [],
            "platform_fault_domain": -1,
            "priority": "Regular",
            "private_ip_address": "10.0.1.4",
            "private_ip_addresses": [
              "10.0.1.4"
            ],
            "provision_vm_agent": true,
            "proximity_placement_group_id": "",
            "public_ip_address": "40.76.121.197",
            "public_ip_addresses": [
              "40.76.121.197"
            ],
            "reboot_setting": "",
            "resource_group_name": "jubilee-azure-foundation-rg",
            "secret": [],
            "secure_boot_enabled": false,
            "size": "Standard_D2s_v3",
            "source_image_id": "",
            "source_image_reference": [
              {
                "offer": "0001-com-ubuntu-server-jammy",
                "publisher": "Canonical",
                "sku": "22_04-lts-gen2",
                "version": "latest"
              }
            ],
            "tags": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Project": "jubilee-azure-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "termination_notification": null,
            "timeouts": null,
            "user_data": "",
            "virtual_machine_id": "6996ba5a-20f2-4f27-90a2-26f5c6c4bff6",
            "virtual_machine_scale_set_id": "",
            "vm_agent_platform_updates_enabled": false,
            "vtpm_enabled": false,
            "zone": "3"
          },
          "sensitive_attributes": [
            [
              {
                "type": "get_attr",
                "value": "admin_password"
              }
            ],
            [
              {
                "type": "get_attr",
                "value": "custom_data"
              }
            ]
          ],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoyNzAwMDAwMDAwMDAwLCJkZWxldGUiOjI3MDAwMDAwMDAwMDAsInJlYWQiOjMwMDAwMDAwMDAwMCwidXBkYXRlIjoyNzAwMDAwMDAwMDAwfX0=",
          "dependencies": [
            "azurerm_network_interface.bastion",
            "azurerm_public_ip.bastion",
            "azurerm_resource_group.main",
            "azurerm_subnet.public",
            "azurerm_virtual_network.main",
            "tls_private_key.ssh"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azurerm_linux_virtual_machine",
      "name": "web_private",
      "provider": "provider[\"registry.terraform.io/hashicorp/azurerm\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "additional_capabilities": [],
            "admin_password": null,
            "admin_ssh_key": [
              {
                "public_key": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC03WFBa9gOXiLXLJpS0hCNiY9w2cjG4p3EB3dlbZ1gN+QPy6W7wDcdDuZgHzLXsryMlfWhrQ0zFa2KcbbXlkN+lC6TUntEfq3Lhw1KDpIVAK1Klqx72MOhVmWbJp1e6+LMLT94eByugR4sc9rgNwUrvdzP8aUgg8lg0IqpBNmb9l7Kf2ac1JEvxYHn2pWY0CJgU4vtzz1DCumnd/6lppMxLwL6zJ5htKfNxWF39PKWYfZRCQL54MAwhJcfvIk4uMHTmE4Mqf29WF5RcGc1oc7yzedaOlkf64SsE/3AmThqsVffV2RyMpP9XLmJHLcH3/+BaKzOe3yAiNG1B8689yCczEH5YjmlkQiGxWXMi8ZEB25qzW69hzP4Ev4C+KH5OW93qYjOIHzY37Fk6quj3+s/3ntTlvxpSVWxuNtqc1dpGmgEPRkQkYff+xk0FlIqZla774PnWfl46flxLsbfjduYHX5kkqaY7hI3gJNHOlNNRqSYw1Ag+BWNLyOhufD2sT5lip0IZntNDYfe8im+BnKB8QBCK3x4WY1aD8h+AOWlSLV2wAnpxrdabEUdGjEByC3R7gZjY04k5vXJ3scl82HV5PSkXsUupnxh4y0Ge5S/7IkxBbxnZAyPiWPuvTc3gIKDCwz1Qj/EotdGyK4Yqd1OJVSgpf2xw/YcjT75KJ/9Cw==\n",
                "username": "azureuser"
              }
            ],
            "admin_username": "azureuser",
            "allow_extension_operations": true,
            "availability_set_id": "",
            "boot_diagnostics": [],
            "bypass_platform_safety_checks_on_user_schedule_enabled": false,
            "capacity_reservation_group_id": "",
            "computer_name": "web-private-vm",
            "custom_data": "IyEvYmluL2Jhc2gKYXB0LWdldCB1cGRhdGUKYXB0LWdldCBpbnN0YWxsIC15IHB5dGhvbjMKbWtkaXIgLXAgL3Zhci93d3cvd2ViCgpjYXQgPiAvdmFyL3d3dy93ZWIvaW5kZXguaHRtbCA8PCdIVE1MJwo8aHRtbD4KICA8Ym9keT4KICAgIDxoMT5KdWJpbGVlIENsb3VkIEZvdW5kYXRpb24gKEF6dXJlIEVkaXRpb24pPC9oMT4KICAgIDxwPlRoaXMgd2ViIHNlcnZlciBpcyBydW5uaW5nIGluIGEgcHJpdmF0ZSBBenVyZSBzdWJuZXQuPC9wPgogICAgPHA+T25seSBhcHByb3ZlZCBpbnRlcm5hbCB0cmFmZmljIGNhbiByZWFjaCBpdC48L3A+CiAgPC9ib2R5Pgo8L2h0bWw+CkhUTUwKCmNhdCA+IC9ldGMvc3lzdGVtZC9zeXN0ZW0vc2ltcGxlLXdlYi5zZXJ2aWNlIDw8J1VOSVQnCltVbml0XQpEZXNjcmlwdGlvbj1TaW1wbGUgUHl0aG9uIFdlYiBTZXJ2ZXIKQWZ0ZXI9bmV0d29yay50YXJnZXQKCltTZXJ2aWNlXQpFeGVjU3RhcnQ9L3Vzci9iaW4vcHl0aG9uMyAtbSBodHRwLnNlcnZlciA4MCAtLWRpcmVjdG9yeSAvdmFyL3d3dy93ZWIKUmVzdGFydD1hbHdheXMKVXNlcj1yb290CgpbSW5zdGFsbF0KV2FudGVkQnk9bXVsdGktdXNlci50YXJnZXQKVU5JVAoKc3lzdGVtY3RsIGRhZW1vbi1yZWxvYWQKc3lzdGVtY3RsIGVuYWJsZSAtLW5vdyBzaW1wbGUtd2ViLnNlcnZpY2U=",
            "dedicated_host_group_id": "",
            "dedicated_host_id": "",
            "disable_password_authentication": true,
            "disk_controller_type": "SCSI",
            "edge_zone": "",
            "encryption_at_host_enabled": false,
            "eviction_policy": "",
            "extensions_time_budget": "PT1H30M",
            "gallery_application": [],
            "id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Compute/virtualMachines/web-private-vm",
            "identity": [],
            "license_type": "",
            "location": "eastus",
            "max_bid_price": -1,
            "name": "web-private-vm",
            "network_interface_ids": [
              "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Network/networkInterfaces/jubilee-azure-foundation-web-nic"
            ],
            "os_disk": [
              {
                "caching": "ReadWrite",
                "diff_disk_settings": [],
                "disk_encryption_set_id": "",
                "disk_size_gb": 30,
                "name": "web-private-vm_OsDisk_1_4fc87548f8ea414ba453efadd116c311",
                "secure_vm_disk_encryption_set_id": "",
                "security_encryption_type": "",
                "storage_account_type": "Standard_LRS",
                "write_accelerator_enabled": false
              }
            ],
            "os_image_notification": [],
            "patch_assessment_mode": "ImageDefault",
            "patch_mode": "ImageDefault",
            "plan": [],
            "platform_fault_domain": -1,
            "priority": "Regular",
            "private_ip_address": "10.0.2.4",
            "private_ip_addresses": [
              "10.0.2.4"
            ],
            "provision_vm_agent": true,
            "proximity_placement_group_id": "",
            "public_ip_address": "",
            "public_ip_addresses": [],
            "reboot_setting": "",
            "resource_group_name": "jubilee-azure-foundation-rg",
            "secret": [],
            "secure_boot_enabled": false,
            "size": "Standard_D2s_v3",
            "source_image_id": "",
            "source_image_reference": [
              {
                "offer": "0001-com-ubuntu-server-jammy",
                "publisher": "Canonical",
                "sku": "22_04-lts-gen2",
                "version": "latest"
              }
            ],
            "tags": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Project": "jubilee-azure-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "termination_notification": null,
            "timeouts": null,
            "user_data": "",
            "virtual_machine_id": "c049bc33-9f4b-4cb4-8194-ffb16d582c50",
            "virtual_machine_scale_set_id": "",
            "vm_agent_platform_updates_enabled": false,
            "vtpm_enabled": false,
            "zone": "3"
          },
          "sensitive_attributes": [
            [
              {
                "type": "get_attr",
                "value": "admin_password"
              }
            ],
            [
              {
                "type": "get_attr",
                "value": "custom_data"
              }
            ]
          ],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoyNzAwMDAwMDAwMDAwLCJkZWxldGUiOjI3MDAwMDAwMDAwMDAsInJlYWQiOjMwMDAwMDAwMDAwMCwidXBkYXRlIjoyNzAwMDAwMDAwMDAwfX0=",
          "dependencies": [
            "azurerm_network_interface.web",
            "azurerm_resource_group.main",
            "azurerm_subnet.private",
            "azurerm_virtual_network.main",
            "tls_private_key.ssh"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azurerm_network_interface",
      "name": "bastion",
      "provider": "provider[\"registry.terraform.io/hashicorp/azurerm\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "accelerated_networking_enabled": false,
            "applied_dns_servers": [],
            "auxiliary_mode": "",
            "auxiliary_sku": "",
            "dns_servers": [],
            "edge_zone": "",
            "enable_accelerated_networking": false,
            "enable_ip_forwarding": false,
            "id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Network/networkInterfaces/jubilee-azure-foundation-bastion-nic",
            "internal_dns_name_label": "",
            "internal_domain_name_suffix": "a5azgqucfb4etcw30u0kgg1cgh.bx.internal.cloudapp.net",
            "ip_configuration": [
              {
                "gateway_load_balancer_frontend_ip_configuration_id": "",
                "name": "internal",
                "primary": true,
                "private_ip_address": "10.0.1.4",
                "private_ip_address_allocation": "Dynamic",
                "private_ip_address_version": "IPv4",
                "public_ip_address_id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Network/publicIPAddresses/jubilee-azure-foundation-bastion-pip",
                "subnet_id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Network/virtualNetworks/jubilee-azure-foundation-vnet/subnets/public-subnet-a"
              }
            ],
            "ip_forwarding_enabled": false,
            "location": "eastus",
            "mac_address": "",
            "name": "jubilee-azure-foundation-bastion-nic",
            "private_ip_address": "10.0.1.4",
            "private_ip_addresses": [
              "10.0.1.4"
            ],
            "resource_group_name": "jubilee-azure-foundation-rg",
            "tags": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Project": "jubilee-azure-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "timeouts": null,
            "virtual_machine_id": ""
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxODAwMDAwMDAwMDAwLCJkZWxldGUiOjE4MDAwMDAwMDAwMDAsInJlYWQiOjMwMDAwMDAwMDAwMCwidXBkYXRlIjoxODAwMDAwMDAwMDAwfX0=",
          "dependencies": [
            "azurerm_public_ip.bastion",
            "azurerm_resource_group.main",
            "azurerm_subnet.public",
            "azurerm_virtual_network.main"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azurerm_network_interface",
      "name": "web",
      "provider": "provider[\"registry.terraform.io/hashicorp/azurerm\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "accelerated_networking_enabled": false,
            "applied_dns_servers": [],
            "auxiliary_mode": "",
            "auxiliary_sku": "",
            "dns_servers": [],
            "edge_zone": "",
            "enable_accelerated_networking": false,
            "enable_ip_forwarding": false,
            "id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Network/networkInterfaces/jubilee-azure-foundation-web-nic",
            "internal_dns_name_label": "",
            "internal_domain_name_suffix": "a5azgqucfb4etcw30u0kgg1cgh.bx.internal.cloudapp.net",
            "ip_configuration": [
              {
                "gateway_load_balancer_frontend_ip_configuration_id": "",
                "name": "internal",
                "primary": true,
                "private_ip_address": "10.0.2.4",
                "private_ip_address_allocation": "Dynamic",
                "private_ip_address_version": "IPv4",
                "public_ip_address_id": "",
                "subnet_id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Network/virtualNetworks/jubilee-azure-foundation-vnet/subnets/private-subnet-a"
              }
            ],
            "ip_forwarding_enabled": false,
            "location": "eastus",
            "mac_address": "",
            "name": "jubilee-azure-foundation-web-nic",
            "private_ip_address": "10.0.2.4",
            "private_ip_addresses": [
              "10.0.2.4"
            ],
            "resource_group_name": "jubilee-azure-foundation-rg",
            "tags": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Project": "jubilee-azure-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "timeouts": null,
            "virtual_machine_id": ""
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxODAwMDAwMDAwMDAwLCJkZWxldGUiOjE4MDAwMDAwMDAwMDAsInJlYWQiOjMwMDAwMDAwMDAwMCwidXBkYXRlIjoxODAwMDAwMDAwMDAwfX0=",
          "dependencies": [
            "azurerm_resource_group.main",
            "azurerm_subnet.private",
            "azurerm_virtual_network.main"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azurerm_network_security_group",
      "name": "bastion",
      "provider": "provider[\"registry.terraform.io/hashicorp/azurerm\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Network/networkSecurityGroups/jubilee-azure-foundation-bastion-nsg",
            "location": "eastus",
            "name": "jubilee-azure-foundation-bastion-nsg",
            "resource_group_name": "jubilee-azure-foundation-rg",
            "security_rule": [],
            "tags": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Project": "jubilee-azure-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxODAwMDAwMDAwMDAwLCJkZWxldGUiOjE4MDAwMDAwMDAwMDAsInJlYWQiOjMwMDAwMDAwMDAwMCwidXBkYXRlIjoxODAwMDAwMDAwMDAwfX0=",
          "dependencies": [
            "azurerm_resource_group.main"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azurerm_network_security_group",
      "name": "web",
      "provider": "provider[\"registry.terraform.io/hashicorp/azurerm\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Network/networkSecurityGroups/jubilee-azure-foundation-web-nsg",
            "location": "eastus",
            "name": "jubilee-azure-foundation-web-nsg",
            "resource_group_name": "jubilee-azure-foundation-rg",
            "security_rule": [],
            "tags": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Project": "jubilee-azure-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxODAwMDAwMDAwMDAwLCJkZWxldGUiOjE4MDAwMDAwMDAwMDAsInJlYWQiOjMwMDAwMDAwMDAwMCwidXBkYXRlIjoxODAwMDAwMDAwMDAwfX0=",
          "dependencies": [
            "azurerm_resource_group.main"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azurerm_network_security_rule",
      "name": "bastion_ssh",
      "provider": "provider[\"registry.terraform.io/hashicorp/azurerm\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "access": "Allow",
            "description": "",
            "destination_address_prefix": "*",
            "destination_address_prefixes": null,
            "destination_application_security_group_ids": null,
            "destination_port_range": "22",
            "destination_port_ranges": null,
            "direction": "Inbound",
            "id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Network/networkSecurityGroups/jubilee-azure-foundation-bastion-nsg/securityRules/AllowSSH",
            "name": "AllowSSH",
            "network_security_group_name": "jubilee-azure-foundation-bastion-nsg",
            "priority": 100,
            "protocol": "Tcp",
            "resource_group_name": "jubilee-azure-foundation-rg",
            "source_address_prefix": "41.139.243.97/32",
            "source_address_prefixes": null,
            "source_application_security_group_ids": null,
            "source_port_range": "*",
            "source_port_ranges": null,
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxODAwMDAwMDAwMDAwLCJkZWxldGUiOjE4MDAwMDAwMDAwMDAsInJlYWQiOjMwMDAwMDAwMDAwMCwidXBkYXRlIjoxODAwMDAwMDAwMDAwfX0=",
          "dependencies": [
            "azurerm_network_security_group.bastion",
            "azurerm_resource_group.main"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azurerm_network_security_rule",
      "name": "web_http",
      "provider": "provider[\"registry.terraform.io/hashicorp/azurerm\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "access": "Allow",
            "description": "",
            "destination_address_prefix": "*",
            "destination_address_prefixes": null,
            "destination_application_security_group_ids": null,
            "destination_port_range": "80",
            "destination_port_ranges": null,
            "direction": "Inbound",
            "id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Network/networkSecurityGroups/jubilee-azure-foundation-web-nsg/securityRules/AllowHTTPFromBastion",
            "name": "AllowHTTPFromBastion",
            "network_security_group_name": "jubilee-azure-foundation-web-nsg",
            "priority": 100,
            "protocol": "Tcp",
            "resource_group_name": "jubilee-azure-foundation-rg",
            "source_address_prefix": "10.0.1.0/24",
            "source_address_prefixes": null,
            "source_application_security_group_ids": null,
            "source_port_range": "*",
            "source_port_ranges": null,
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxODAwMDAwMDAwMDAwLCJkZWxldGUiOjE4MDAwMDAwMDAwMDAsInJlYWQiOjMwMDAwMDAwMDAwMCwidXBkYXRlIjoxODAwMDAwMDAwMDAwfX0=",
          "dependencies": [
            "azurerm_network_security_group.web",
            "azurerm_resource_group.main"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azurerm_public_ip",
      "name": "bastion",
      "provider": "provider[\"registry.terraform.io/hashicorp/azurerm\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "allocation_method": "Static",
            "ddos_protection_mode": "VirtualNetworkInherited",
            "ddos_protection_plan_id": null,
            "domain_name_label": null,
            "edge_zone": "",
            "fqdn": null,
            "id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Network/publicIPAddresses/jubilee-azure-foundation-bastion-pip",
            "idle_timeout_in_minutes": 4,
            "ip_address": "40.76.121.197",
            "ip_tags": null,
            "ip_version": "IPv4",
            "location": "eastus",
            "name": "jubilee-azure-foundation-bastion-pip",
            "public_ip_prefix_id": null,
            "resource_group_name": "jubilee-azure-foundation-rg",
            "reverse_fqdn": null,
            "sku": "Standard",
            "sku_tier": "Regional",
            "tags": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Project": "jubilee-azure-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "timeouts": null,
            "zones": [
              "3"
            ]
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxODAwMDAwMDAwMDAwLCJkZWxldGUiOjE4MDAwMDAwMDAwMDAsInJlYWQiOjMwMDAwMDAwMDAwMCwidXBkYXRlIjoxODAwMDAwMDAwMDAwfX0=",
          "dependencies": [
            "azurerm_resource_group.main"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azurerm_resource_group",
      "name": "main",
      "provider": "provider[\"registry.terraform.io/hashicorp/azurerm\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg",
            "location": "eastus",
            "managed_by": "",
            "name": "jubilee-azure-foundation-rg",
            "tags": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Project": "jubilee-azure-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo1NDAwMDAwMDAwMDAwLCJkZWxldGUiOjU0MDAwMDAwMDAwMDAsInJlYWQiOjMwMDAwMDAwMDAwMCwidXBkYXRlIjo1NDAwMDAwMDAwMDAwfX0="
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azurerm_role_assignment",
      "name": "admins",
      "provider": "provider[\"registry.terraform.io/hashicorp/azurerm\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "condition": "",
            "condition_version": "",
            "delegated_managed_identity_resource_id": "",
            "description": "",
            "id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Authorization/roleAssignments/a539372c-e613-a87d-ddc3-76095c87055f",
            "name": "a539372c-e613-a87d-ddc3-76095c87055f",
            "principal_id": "289844c5-3cc2-45ef-85c6-286663143b3d",
            "principal_type": "Group",
            "role_definition_id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/providers/Microsoft.Authorization/roleDefinitions/8e3af657-a8ff-443c-a75c-2fe8c4bcb635",
            "role_definition_name": "Owner",
            "scope": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg",
            "skip_service_principal_aad_check": null,
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxODAwMDAwMDAwMDAwLCJkZWxldGUiOjE4MDAwMDAwMDAwMDAsInJlYWQiOjMwMDAwMDAwMDAwMH19",
          "dependencies": [
            "azuread_group.admins",
            "azurerm_resource_group.main"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azurerm_role_assignment",
      "name": "auditors",
      "provider": "provider[\"registry.terraform.io/hashicorp/azurerm\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "condition": "",
            "condition_version": "",
            "delegated_managed_identity_resource_id": "",
            "description": "",
            "id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Authorization/roleAssignments/8b6613a7-8ba8-5dd2-393f-4a94e744867f",
            "name": "8b6613a7-8ba8-5dd2-393f-4a94e744867f",
            "principal_id": "fab88f76-cdbe-4662-be03-cc38edb0def1",
            "principal_type": "Group",
            "role_definition_id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/providers/Microsoft.Authorization/roleDefinitions/acdd72a7-3385-48ef-bd42-f606fba81ae7",
            "role_definition_name": "Reader",
            "scope": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg",
            "skip_service_principal_aad_check": null,
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxODAwMDAwMDAwMDAwLCJkZWxldGUiOjE4MDAwMDAwMDAwMDAsInJlYWQiOjMwMDAwMDAwMDAwMH19",
          "dependencies": [
            "azuread_group.auditors",
            "azurerm_resource_group.main"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azurerm_role_assignment",
      "name": "engineers",
      "provider": "provider[\"registry.terraform.io/hashicorp/azurerm\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "condition": "",
            "condition_version": "",
            "delegated_managed_identity_resource_id": "",
            "description": "",
            "id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Authorization/roleAssignments/0bd773c9-4a8c-3db7-d5e7-7fa7d16ce4ea",
            "name": "0bd773c9-4a8c-3db7-d5e7-7fa7d16ce4ea",
            "principal_id": "0ebb4a99-2895-4846-b1e5-042d7edccf13",
            "principal_type": "Group",
            "role_definition_id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c",
            "role_definition_name": "Contributor",
            "scope": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg",
            "skip_service_principal_aad_check": null,
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxODAwMDAwMDAwMDAwLCJkZWxldGUiOjE4MDAwMDAwMDAwMDAsInJlYWQiOjMwMDAwMDAwMDAwMH19",
          "dependencies": [
            "azuread_group.engineers",
            "azurerm_resource_group.main"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azurerm_subnet",
      "name": "private",
      "provider": "provider[\"registry.terraform.io/hashicorp/azurerm\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "address_prefixes": [
              "10.0.2.0/24"
            ],
            "default_outbound_access_enabled": true,
            "delegation": [],
            "enforce_private_link_endpoint_network_policies": false,
            "enforce_private_link_service_network_policies": false,
            "id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Network/virtualNetworks/jubilee-azure-foundation-vnet/subnets/private-subnet-a",
            "name": "private-subnet-a",
            "private_endpoint_network_policies": "Enabled",
            "private_endpoint_network_policies_enabled": true,
            "private_link_service_network_policies_enabled": true,
            "resource_group_name": "jubilee-azure-foundation-rg",
            "service_endpoint_policy_ids": null,
            "service_endpoints": null,
            "timeouts": null,
            "virtual_network_name": "jubilee-azure-foundation-vnet"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxODAwMDAwMDAwMDAwLCJkZWxldGUiOjE4MDAwMDAwMDAwMDAsInJlYWQiOjMwMDAwMDAwMDAwMCwidXBkYXRlIjoxODAwMDAwMDAwMDAwfX0=",
          "dependencies": [
            "azurerm_resource_group.main",
            "azurerm_virtual_network.main"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azurerm_subnet",
      "name": "public",
      "provider": "provider[\"registry.terraform.io/hashicorp/azurerm\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "address_prefixes": [
              "10.0.1.0/24"
            ],
            "default_outbound_access_enabled": true,
            "delegation": [],
            "enforce_private_link_endpoint_network_policies": false,
            "enforce_private_link_service_network_policies": false,
            "id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Network/virtualNetworks/jubilee-azure-foundation-vnet/subnets/public-subnet-a",
            "name": "public-subnet-a",
            "private_endpoint_network_policies": "Enabled",
            "private_endpoint_network_policies_enabled": true,
            "private_link_service_network_policies_enabled": true,
            "resource_group_name": "jubilee-azure-foundation-rg",
            "service_endpoint_policy_ids": null,
            "service_endpoints": null,
            "timeouts": null,
            "virtual_network_name": "jubilee-azure-foundation-vnet"
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxODAwMDAwMDAwMDAwLCJkZWxldGUiOjE4MDAwMDAwMDAwMDAsInJlYWQiOjMwMDAwMDAwMDAwMCwidXBkYXRlIjoxODAwMDAwMDAwMDAwfX0=",
          "dependencies": [
            "azurerm_resource_group.main",
            "azurerm_virtual_network.main"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azurerm_subnet_network_security_group_association",
      "name": "private",
      "provider": "provider[\"registry.terraform.io/hashicorp/azurerm\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Network/virtualNetworks/jubilee-azure-foundation-vnet/subnets/private-subnet-a",
            "network_security_group_id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Network/networkSecurityGroups/jubilee-azure-foundation-web-nsg",
            "subnet_id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Network/virtualNetworks/jubilee-azure-foundation-vnet/subnets/private-subnet-a",
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxODAwMDAwMDAwMDAwLCJkZWxldGUiOjE4MDAwMDAwMDAwMDAsInJlYWQiOjMwMDAwMDAwMDAwMH19",
          "dependencies": [
            "azurerm_network_security_group.web",
            "azurerm_resource_group.main",
            "azurerm_subnet.private",
            "azurerm_virtual_network.main"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azurerm_subnet_network_security_group_association",
      "name": "public",
      "provider": "provider[\"registry.terraform.io/hashicorp/azurerm\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Network/virtualNetworks/jubilee-azure-foundation-vnet/subnets/public-subnet-a",
            "network_security_group_id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Network/networkSecurityGroups/jubilee-azure-foundation-bastion-nsg",
            "subnet_id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Network/virtualNetworks/jubilee-azure-foundation-vnet/subnets/public-subnet-a",
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxODAwMDAwMDAwMDAwLCJkZWxldGUiOjE4MDAwMDAwMDAwMDAsInJlYWQiOjMwMDAwMDAwMDAwMH19",
          "dependencies": [
            "azurerm_network_security_group.bastion",
            "azurerm_resource_group.main",
            "azurerm_subnet.public",
            "azurerm_virtual_network.main"
          ]
        }
      ]
    },
    {
      "mode": "managed",
      "type": "azurerm_virtual_network",
      "name": "main",
      "provider": "provider[\"registry.terraform.io/hashicorp/azurerm\"]",
      "instances": [
        {
          "schema_version": 0,
          "attributes": {
            "address_space": [
              "10.0.0.0/16"
            ],
            "bgp_community": "",
            "ddos_protection_plan": [],
            "dns_servers": [],
            "edge_zone": "",
            "encryption": [],
            "flow_timeout_in_minutes": 0,
            "guid": "4293c107-2882-497c-8add-d534a31b6237",
            "id": "/subscriptions/4d369de9-84e3-4d1d-a240-ad346ba1bf4e/resourceGroups/jubilee-azure-foundation-rg/providers/Microsoft.Network/virtualNetworks/jubilee-azure-foundation-vnet",
            "location": "eastus",
            "name": "jubilee-azure-foundation-vnet",
            "resource_group_name": "jubilee-azure-foundation-rg",
            "subnet": [],
            "tags": {
              "CostCenter": "learning",
              "DataClassification": "internal",
              "Environment": "dev",
              "Project": "jubilee-azure-foundation",
              "Purpose": "cloud-engineer-training"
            },
            "timeouts": null
          },
          "sensitive_attributes": [],
          "identity_schema_version": 0,
          "private": "eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjoxODAwMDAwMDAwMDAwLCJkZWxldGUiOjE4MDAwMDAwMDAwMDAsInJlYWQiOjMwMDAwMDAwMDAwMCwidXBkYXRlIjoxODAwMDAwMDAwMDAwfX0=",
          "dependencies": [
            "azurerm_resource_group.main"
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
          "index_key": 0,
          "schema_version": 0,
          "attributes": {
            "content": "-----BEGIN OPENSSH PRIVATE KEY-----\n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\n-----END OPENSSH PRIVATE KEY-----\n",
            "content_base64": null,
            "content_base64sha256": "ubW0CS9L295QNrVfSdAw7m71b9OcxAGr32esLJsqse0=",
            "content_base64sha512": "5KxgH6kGkuc/ss3rydtqADupnRjVFbWYjY5yWyCy//x6n9eVMf+naTboKHdwyonVgZo4uutVaQxXdSY/mkiJug==",
            "content_md5": "f7aa32f0c98eea06e7d656fb9eda3b52",
            "content_sha1": "36dcb79932c8f7c208bb7027848b9449d8ba1a87",
            "content_sha256": "b9b5b4092f4bdbde5036b55f49d030ee6ef56fd39cc401abdf67ac2c9b2ab1ed",
            "content_sha512": "e4ac601fa90692e73fb2cdebc9db6a003ba99d18d515b5988d8e725b20b2fffc7a9fd79531ffa76936e8287770ca89d5819a38baeb55690c5775263f9a4889ba",
            "directory_permission": "0777",
            "file_permission": "0600",
            "filename": "./jubilee-azure-foundation-key.pem",
            "id": "36dcb79932c8f7c208bb7027848b9449d8ba1a87",
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
      "type": "random_password",
      "name": "entra_users",
      "provider": "provider[\"registry.terraform.io/hashicorp/random\"]",
      "instances": [
        {
          "index_key": "admin.lab",
          "schema_version": 3,
          "attributes": {
            "bcrypt_hash": "$2a$10$5Vlge7jE5cBswN2cp6xAaObd4u1AzSaRSYgve86stWWbpdXQhr5S2",
            "id": "none",
            "keepers": null,
            "length": 16,
            "lower": true,
            "min_lower": 0,
            "min_numeric": 0,
            "min_special": 0,
            "min_upper": 0,
            "number": true,
            "numeric": true,
            "override_special": "!@#$%^\u0026*()-_=+[]{}",
            "result": "uDcO+W84Z\u0026(FS1O]",
            "special": true,
            "upper": true
          },
          "sensitive_attributes": [
            [
              {
                "type": "get_attr",
                "value": "bcrypt_hash"
              }
            ],
            [
              {
                "type": "get_attr",
                "value": "result"
              }
            ]
          ],
          "identity_schema_version": 0,
          "dependencies": [
            "azuread_group.admins",
            "azuread_group.auditors",
            "azuread_group.engineers"
          ]
        },
        {
          "index_key": "auditor.lab",
          "schema_version": 3,
          "attributes": {
            "bcrypt_hash": "$2a$10$x9VbOA2PnN3wcEcPCmvy6OXGQks48wEJg8c965cKZy0MQkoKq64Yu",
            "id": "none",
            "keepers": null,
            "length": 16,
            "lower": true,
            "min_lower": 0,
            "min_numeric": 0,
            "min_special": 0,
            "min_upper": 0,
            "number": true,
            "numeric": true,
            "override_special": "!@#$%^\u0026*()-_=+[]{}",
            "result": "gG^kbKKQSwj8bCGi",
            "special": true,
            "upper": true
          },
          "sensitive_attributes": [
            [
              {
                "type": "get_attr",
                "value": "bcrypt_hash"
              }
            ],
            [
              {
                "type": "get_attr",
                "value": "result"
              }
            ]
          ],
          "identity_schema_version": 0,
          "dependencies": [
            "azuread_group.admins",
            "azuread_group.auditors",
            "azuread_group.engineers"
          ]
        },
        {
          "index_key": "engineer.lab",
          "schema_version": 3,
          "attributes": {
            "bcrypt_hash": "$2a$10$vIKQT.a6cTEOwBD.BYu6FObHOdjlj/z1RJUYHEgOewktykSyaItPq",
            "id": "none",
            "keepers": null,
            "length": 16,
            "lower": true,
            "min_lower": 0,
            "min_numeric": 0,
            "min_special": 0,
            "min_upper": 0,
            "number": true,
            "numeric": true,
            "override_special": "!@#$%^\u0026*()-_=+[]{}",
            "result": "*D}*0q_nV3\u0026jIAPu",
            "special": true,
            "upper": true
          },
          "sensitive_attributes": [
            [
              {
                "type": "get_attr",
                "value": "bcrypt_hash"
              }
            ],
            [
              {
                "type": "get_attr",
                "value": "result"
              }
            ]
          ],
          "identity_schema_version": 0,
          "dependencies": [
            "azuread_group.admins",
            "azuread_group.auditors",
            "azuread_group.engineers"
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
            "id": "b7c8d904ae4caaf4481dd63da110b976d75170f5",
            "private_key_openssh": "-----BEGIN OPENSSH PRIVATE KEY-----\n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\n-----END OPENSSH PRIVATE KEY-----\n",
            "private_key_pem": "-----BEGIN RSA PRIVATE KEY-----\n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\n-----END RSA PRIVATE KEY-----\n",
            "private_key_pem_pkcs8": "-----BEGIN PRIVATE KEY-----\n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\nQbSWlGZtznIYb2ePbgaU5kXIpHYy\n-----END PRIVATE KEY-----\n",
            "public_key_fingerprint_md5": "6f:2f:db:19:cf:ff:af:e1:a9:0b:62:7e:8f:9a:31:8a",
            "public_key_fingerprint_sha256": "SHA256:z77+ILPe7gVQrbWkClRz2eiHO1ryIw9TsvOZJRJBsHk",
            "public_key_openssh": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC03WFBa9gOXiLXLJpS0hCNiY9w2cjG4p3EB3dlbZ1gN+QPy6W7wDcdDuZgHzLXsryMlfWhrQ0zFa2KcbbXlkN+lC6TUntEfq3Lhw1KDpIVAK1Klqx72MOhVmWbJp1e6+LMLT94eByugR4sc9rgNwUrvdzP8aUgg8lg0IqpBNmb9l7Kf2ac1JEvxYHn2pWY0CJgU4vtzz1DCumnd/6lppMxLwL6zJ5htKfNxWF39PKWYfZRCQL54MAwhJcfvIk4uMHTmE4Mqf29WF5RcGc1oc7yzedaOlkf64SsE/3AmThqsVffV2RyMpP9XLmJHLcH3/+BaKzOe3yAiNG1B8689yCczEH5YjmlkQiGxWXMi8ZEB25qzW69hzP4Ev4C+KH5OW93qYjOIHzY37Fk6quj3+s/3ntTlvxpSVWxuNtqc1dpGmgEPRkQkYff+xk0FlIqZla774PnWfl46flxLsbfjduYHX5kkqaY7hI3gJNHOlNNRqSYw1Ag+BWNLyOhufD2sT5lip0IZntNDYfe8im+BnKB8QBCK3x4WY1aD8h+AOWlSLV2wAnpxrdabEUdGjEByC3R7gZjY04k5vXJ3scl82HV5PSkXsUupnxh4y0Ge5S/7IkxBbxnZAyPiWPuvTc3gIKDCwz1Qj/EotdGyK4Yqd1OJVSgpf2xw/YcjT75KJ/9Cw==\n",
            "public_key_pem": "-----BEGIN PUBLIC KEY-----\nMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAtN1hQWvYDl4i1yyaUtIQ\njYmPcNnIxuKdxAd3ZW2dYDfkD8ulu8A3HQ7mYB8y17K8jJX1oa0NMxWtinG215ZD\nfpQuk1J7RH6ty4cNSg6SFQCtSpase9jDoVZlmyadXuvizC0/eHgcroEeLHPa4DcF\nK73cz/GlIIPJYNCKqQTZm/Zeyn9mnNSRL8WB59qVmNAiYFOL7c89Qwrpp3f+paaT\nMS8C+syeYbSnzcVhd/TylmH2UQkC+eDAMISXH7yJOLjB05hODKn9vVheUXBnNaHO\n8s3nWjpZH+uErBP9wJk4arFX31dkcjKT/Vy5iRy3B9//gWisznt8gIjRtQfOvPcg\nnMxB+WI5pZEIhsVlzIvGRAduas1uvYcz+BL+Avih+Tlvd6mIziB82N+xZOqro9/r\nP957U5b8aUlVsbjbanNXaRpoBD0ZEJGH3/sZNBZSKmZWu++D51n5eOn5cS7G343b\nmB1+ZJKmmO4SN4CTRzpTTUakmMNQIPgVjS8jobnw9rE+ZYqdCGZ7TQ2H3vIpvgZy\ngfEAQit8eFmNWg/IfgDlpUi1dsAJ6ca3WmxFHRoxAcgt0e4GY2NOJOb1yd7HJfNh\n1eT0pF7FLqZ8YeMtBnuUv+yJMQW8Z2QMj4lj7r03N4CCgwsM9UI/xKLXRsiuGKnd\nTiVUoKX9scP2HI0++Sif/QsCAwEAAQ==\n-----END PUBLIC KEY-----\n",
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
  "check_results": null
}

```


<div style='page-break-after: always;'></div>

# File: terraform.tfvars

```tfvars
azure_region        = "eastus"
instance_type       = "Standard_D2s_v3"
availability_zone   = "3"
project             = "jubilee-azure-foundation"
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"

# GET YOUR IP: curl ifconfig.me

my_ip = "41.139.243.97/32"

create_budget        = true
monthly_budget_limit = 5
billing_alert_emails = [
  "ahoosoftwares@gmail.com",
  "ahootech@outlook.com",
  "harryoduwor@gmail.com"
]

create_entra_users = true
entra_domain_name  = "ahootechoutlook.onmicrosoft.com"
```


<div style='page-break-after: always;'></div>

# File: variables.tf

```tf
variable "azure_region" {
  description = "Azure region where resources will be created"
  type        = string
  default     = "eastus"
}

variable "project" {
  description = "Project name used for naming resources"
  type        = string
  default     = "jubilee-azure-foundation"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for the VNet"
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
  description = "Azure VM size. Standard_B1s is very cheap/free-tier eligible."
  type        = string
  default     = "Standard_D2s_v3"
}


variable "availability_zone" {
  description = "Azure Availability Zone to use"
  type        = string
  default     = "3"
}

variable "my_ip" {
  description = "Your public IP address in CIDR format"
  type        = string
}

variable "create_new_key" {
  description = "Generate a new SSH key pair"
  type        = bool
  default     = true
}

variable "create_budget" {
  description = "Create an Azure Cost Management Budget"
  type        = bool
  default     = true
}

variable "monthly_budget_limit" {
  description = "Monthly budget limit in USD"
  type        = number
  default     = 5
}

variable "billing_alert_emails" {
  description = "List of emails for budget alerts"
  type        = list(string)
  default     = []
}

variable "default_tags" {
  type = map(string)
  default = {
    Project            = "jubilee-azure-foundation"
    Environment        = "dev"
    Purpose            = "cloud-engineer-training"
    DataClassification = "internal"
    CostCenter         = "learning"
  }
}

variable "create_entra_users" {
  description = "Set to true to create Entra ID users and add them to groups"
  type        = bool
  default     = false
}

variable "entra_domain_name" {
  description = "Your Azure Entra ID domain, example: yourtenant.onmicrosoft.com"
  type        = string
  default     = ""
}
```


<div style='page-break-after: always;'></div>

# File: web_user_data.sh

```sh
#!/bin/bash
apt-get update
apt-get install -y python3
mkdir -p /var/www/web

cat > /var/www/web/index.html <<'HTML'
<html>
  <body>
    <h1>Jubilee Cloud Foundation (Azure Edition)</h1>
    <p>This web server is running in a private Azure subnet.</p>
    <p>Only approved internal traffic can reach it.</p>
  </body>
</html>
HTML

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

systemctl daemon-reload
systemctl enable --now simple-web.service
```

