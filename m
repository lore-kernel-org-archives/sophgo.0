Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B6D481AA0
	for <sophgo@lists.linux.dev>; Wed,  1 Jul 2026 12:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910368; cv=none; b=F+ifxXug3S7gin29rwtAqaKKPGr8oLWCyUHLl1GLyRW3l51kflIBPdH2cQWldP8bJTcdo0EbZhgKD3RKLlNPuxBhb6SE46ZV1mpKM7lCeppNORuYMJ+CqTGqpdSIIbkDbAjH1zxbwFlIzge0OV7bG521haWO9ngfB7Wr2P7h78E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910368; c=relaxed/simple;
	bh=dYo7yt5dKXk9dCII4EyoUO9rsvHF5lxpieGfcqD1BJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D+nyGW7hjNFY10TuBI3MDvsGhA80R9rXgAUP9YRnPjHrTTQ06BduadFGUA3SW+cHx1hRXyiNjCM9Q7Q2OL6LbbLcChdh6pLmAMyyif24AD2BsgTKKL60EdwOmml9wLfoDBlUN1ATBydyr9oy4xfYyVJEAjD4V19lsrLO+kdVR6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=av3M8r81; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="av3M8r81"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-845c92bc464so362969b3a.2
        for <sophgo@lists.linux.dev>; Wed, 01 Jul 2026 05:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910364; x=1783515164; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F7FgRbrqRmk04PinsQvTrdFcJejR9/1kMD+TePq/fp8=;
        b=av3M8r813LdUpWbkDO/hoMNmeg3qE/dOFsTuqtcUB7SRwn3uRSoe7wLlSvPhhpPZwS
         wulGP2CActUii8D9FZ6VvQfDAcib2KBeQ7md3A3+JPrEV4L45r+mPCYWD3gq3aDYg1u7
         bBdMlUM00iyo9vG4DMJAaSnNRLa5oDlbFDL8EhHtvSTa5u8HxL1k5CTXHTRdiIaAI+8Q
         8b5iYPIPddDEaZPKTKSmU1yHwMtu55Ii933q41IeR2U4zzkr9687OPv/OjwT+/2a/EhM
         6pQw3/EuvhFbSOa+HxQUNjttKNsBIOX37YMKZxY8I5s9nxD1kqRzF9qzT/9DYyE/7ZeK
         8VRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910364; x=1783515164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F7FgRbrqRmk04PinsQvTrdFcJejR9/1kMD+TePq/fp8=;
        b=ftNiD8EgLOm7OuGwn5ioRiSNc89axh7x5ZjBjU3cqu36b4I8dkhjO8vKGc3Z67N3Mh
         BgDhJQAp91/XPHoAEI4/fp8te7x6mlPP87X/newAZdqzhK2s0pvi0IY7vSFye6Y00UFy
         g1ywr6zvSeY6IIJwebwyrbGgK7PO/XZ9OWRS3kdDIACQnFRrXtrsyaogLt4HpU9FpR2M
         luj6JP609Eh5Jom5uAA5nfy1GiA3BrSIYHhNov4o1NLXX9NnKEPwSbr5cXTZKzed8Peh
         R33f6/5XUn2KNLQ9NZtnBM1c7aOwl2UmoKX+pEfSrEiOzadOYjba4XtfKLSJWOWG2BWv
         sB2g==
X-Forwarded-Encrypted: i=1; AHgh+Ro+IQqyxPMyXf72+bw+csWbXKxj6lfHoqA1vbpaHjQoluY9isScCnSoAW2uZDHUPhW2LhvRJEE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxUPlTHwkyG8gRyW8wD1W3S795hNc7z3q2N4Z6Eq0wBH9O5pAw4
	0foAbmfIftN5deBqGI5OKesra8tZG5HL6JZEQP2Xg0IDV8lwpKjSfuUb
X-Gm-Gg: AfdE7clO9crYqdF6jSSeVmsNfLZzLjQziYgkR6SNkVD1rUnPdY17p9WJ5iCPCb9Gbpq
	sSvOKle5IHVGm5D3rNnD88JlHuEQxZIspQc6BDyLS4zBKW/mRza9/DiUaL+gHi75Jcl8whA+gTP
	6iCrlHOZVjeGxYcLHJ/NxBh3Lhm4sb9RVRbZiMowbFBRhoS+LQQoqLEE4J3ZG7wUPtePvlLm7sR
	AHitsuX79zwzUffhA5Yu4A9UHq0oDRzG8iTcaomVP1Lo+zQazuAtJ4VxP9sKP7NURq69EeA2ne0
	5flcviYEDrqRjhsbMvsGlnF/u8wcuyu/EziFJiLlFkbcJFxtzAb8TPDKHggI628qvkBQ08mnDNu
	HO0gTM/pkSckKD5JavLMbdsu5kBZ6YxyHzbLjSPRxnmdq7Op6483rDLX7PENQEMzGII1V8d+U4W
	QviZXRBHUWuKWbuZ8jdj0I
X-Received: by 2002:a05:6a00:a93:b0:847:8921:9bd1 with SMTP id d2e1a72fcca58-847c51ac62cmr576526b3a.53.1782910364383;
        Wed, 01 Jul 2026 05:52:44 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:52:43 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:14 -0400
Subject: [PATCH v5 01/17] dt-bindings: riscv: sort multi-letter Z
 extensions alphanumerically
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-1-2c61f94a695a@gmail.com>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Chen Wang <chen.wang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Jesse Taube <jtaubepe@redhat.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=10987; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=dYo7yt5dKXk9dCII4EyoUO9rsvHF5lxpieGfcqD1BJA=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3mYvHTv2jUo7ph8wd72at61FWY+pNspdruwEm8iP+
 DUPd6d1lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwERm72NkOJDvc37nxjmTONuK
 15yM5atwX/njQMj0K/cNFk+enTT7DR/Df7fyT/4H3JkuzpfM0fePVK3/PC139f/tFiL6l/ufTKl
 YyQ0A
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

The multi-letter extension enum is documented as being sorted
alphanumerically (see the "multi-letter extensions, sorted
alphanumerically" comment), but several Z entries have drifted out of
order.

Reorder the affected entries so the multi-letter Z list is sorted
alphanumerically again.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: Collected Acked-by from Conor Dooley.
v4: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 184 ++++++++++-----------
 1 file changed, 92 insertions(+), 92 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 2b0a8a93bb214..5ffc40d599c02 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -457,6 +457,13 @@ properties:
             merged in the riscv-isa-manual by commit dbc79cf28a2 ("Initial seed
             of zc.adoc to src tree.").
 
+        - const: zclsd
+          description:
+            The Zclsd extension implements the compressed (16-bit) version of the
+            Load/Store Pair for RV32. As with Zilsd, this extension was ratified
+            in commit f88abf1 ("Integrating load/store pair for RV32 with the
+            main manual") of riscv-isa-manual.
+
         - const: zcmop
           description:
             The standard Zcmop extension version 1.0, as ratified in commit
@@ -487,6 +494,22 @@ properties:
             in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
             riscv-isa-manual.
 
+        - const: zicbom
+          description:
+            The standard Zicbom extension for base cache management operations as
+            ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
+
+        - const: zicbop
+          description:
+            The standard Zicbop extension for cache-block prefetch instructions
+            as ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of
+            riscv-CMOs.
+
+        - const: zicboz
+          description:
+            The standard Zicboz extension for cache-block zeroing as ratified
+            in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
+
         - const: ziccamoa
           description:
             The standard Ziccamoa extension for main memory (cacheability and
@@ -514,6 +537,66 @@ properties:
             guarantee on LR/SC sequences, as ratified in commit b1d806605f87
             ("Updated to ratified state.") of the riscv profiles specification.
 
+        - const: zicfilp
+          description: |
+            The standard Zicfilp extension for enforcing forward edge
+            control-flow integrity as ratified in commit 3f8e450 ("merge
+            pull request #227 from ved-rivos/0709") of riscv-cfi
+            github repo.
+
+        - const: zicfiss
+          description: |
+            The standard Zicfiss extension for enforcing backward edge
+            control-flow integrity as ratified in commit 3f8e450 ("merge
+            pull request #227 from ved-rivos/0709") of riscv-cfi
+            github repo.
+
+        - const: zicntr
+          description:
+            The standard Zicntr extension for base counters and timers, as
+            ratified in the 20191213 version of the unprivileged ISA
+            specification.
+
+        - const: zicond
+          description:
+            The standard Zicond extension for conditional arithmetic and
+            conditional-select/move operations as ratified in commit 95cf1f9
+            ("Add changes requested by Ved during signoff") of riscv-zicond.
+
+        - const: zicsr
+          description: |
+            The standard Zicsr extension for control and status register
+            instructions, as ratified in the 20191213 version of the
+            unprivileged ISA specification.
+
+            This does not include Chapter 10, "Counters", which documents
+            special case read-only CSRs, that were moved into the Zicntr and
+            Zihpm extensions after the ratification of the 20191213 version of
+            the unprivileged specification.
+
+        - const: zifencei
+          description:
+            The standard Zifencei extension for instruction-fetch fence, as
+            ratified in the 20191213 version of the unprivileged ISA
+            specification.
+
+        - const: zihintntl
+          description:
+            The standard Zihintntl extension for non-temporal locality hints, as
+            ratified in commit 0dc91f5 ("Zihintntl is ratified") of the
+            riscv-isa-manual.
+
+        - const: zihintpause
+          description:
+            The standard Zihintpause extension for pause hints, as ratified in
+            commit d8ab5c7 ("Zihintpause is ratified") of the riscv-isa-manual.
+
+        - const: zihpm
+          description:
+            The standard Zihpm extension for hardware performance counters, as
+            ratified in the 20191213 version of the unprivileged ISA
+            specification.
+
         - const: zilsd
           description:
             The standard Zilsd extension which provides support for aligned
@@ -521,12 +604,10 @@ properties:
             encodings, as ratified in commit f88abf1 ("Integrating
             load/store pair for RV32 with the main manual") of riscv-isa-manual.
 
-        - const: zclsd
+        - const: zimop
           description:
-            The Zclsd extension implements the compressed (16-bit) version of the
-            Load/Store Pair for RV32. As with Zilsd, this extension was ratified
-            in commit f88abf1 ("Integrating load/store pair for RV32 with the
-            main manual") of riscv-isa-manual.
+            The standard Zimop extension version 1.0, as ratified in commit
+            58220614a5f ("Zimop is ratified/1.0") of the riscv-isa-manual.
 
         - const: zk
           description:
@@ -590,87 +671,6 @@ properties:
             in version 1.0 of RISC-V Cryptography Extensions Volume I
             specification.
 
-        - const: zicbom
-          description:
-            The standard Zicbom extension for base cache management operations as
-            ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
-
-        - const: zicbop
-          description:
-            The standard Zicbop extension for cache-block prefetch instructions
-            as ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of
-            riscv-CMOs.
-
-        - const: zicboz
-          description:
-            The standard Zicboz extension for cache-block zeroing as ratified
-            in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
-
-        - const: zicfilp
-          description: |
-            The standard Zicfilp extension for enforcing forward edge
-            control-flow integrity as ratified in commit 3f8e450 ("merge
-            pull request #227 from ved-rivos/0709") of riscv-cfi
-            github repo.
-
-        - const: zicfiss
-          description: |
-            The standard Zicfiss extension for enforcing backward edge
-            control-flow integrity as ratified in commit 3f8e450 ("merge
-            pull request #227 from ved-rivos/0709") of riscv-cfi
-            github repo.
-
-        - const: zicntr
-          description:
-            The standard Zicntr extension for base counters and timers, as
-            ratified in the 20191213 version of the unprivileged ISA
-            specification.
-
-        - const: zicond
-          description:
-            The standard Zicond extension for conditional arithmetic and
-            conditional-select/move operations as ratified in commit 95cf1f9
-            ("Add changes requested by Ved during signoff") of riscv-zicond.
-
-        - const: zicsr
-          description: |
-            The standard Zicsr extension for control and status register
-            instructions, as ratified in the 20191213 version of the
-            unprivileged ISA specification.
-
-            This does not include Chapter 10, "Counters", which documents
-            special case read-only CSRs, that were moved into the Zicntr and
-            Zihpm extensions after the ratification of the 20191213 version of
-            the unprivileged specification.
-
-        - const: zifencei
-          description:
-            The standard Zifencei extension for instruction-fetch fence, as
-            ratified in the 20191213 version of the unprivileged ISA
-            specification.
-
-        - const: zihintpause
-          description:
-            The standard Zihintpause extension for pause hints, as ratified in
-            commit d8ab5c7 ("Zihintpause is ratified") of the riscv-isa-manual.
-
-        - const: zihintntl
-          description:
-            The standard Zihintntl extension for non-temporal locality hints, as
-            ratified in commit 0dc91f5 ("Zihintntl is ratified") of the
-            riscv-isa-manual.
-
-        - const: zihpm
-          description:
-            The standard Zihpm extension for hardware performance counters, as
-            ratified in the 20191213 version of the unprivileged ISA
-            specification.
-
-        - const: zimop
-          description:
-            The standard Zimop extension version 1.0, as ratified in commit
-            58220614a5f ("Zimop is ratified/1.0") of the riscv-isa-manual.
-
         - const: ztso
           description:
             The standard Ztso extension for total store ordering, as ratified
@@ -809,18 +809,18 @@ properties:
             instructions, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
-        - const: zvksh
-          description: |
-            The standard Zvksh extension for ShangMi suite: SM3 secure hash
-            instructions, as ratified in commit 56ed795 ("Update
-            riscv-crypto-spec-vector.adoc") of riscv-crypto.
-
         - const: zvksg
           description:
             The standard Zvksg extension for ShangMi algorithm suite with GCM
             instructions, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        - const: zvksh
+          description: |
+            The standard Zvksh extension for ShangMi suite: SM3 secure hash
+            instructions, as ratified in commit 56ed795 ("Update
+            riscv-crypto-spec-vector.adoc") of riscv-crypto.
+
         - const: zvkt
           description:
             The standard Zvkt extension for vector data-independent execution

-- 
2.43.0

