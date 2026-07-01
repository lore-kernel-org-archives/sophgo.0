Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A2348A2AA
	for <sophgo@lists.linux.dev>; Wed,  1 Jul 2026 12:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910388; cv=none; b=Y+uduZgaEkpLv/JMfN/v3yoIAEWNZSIMKxHgFJ8eCbekau3e6C6pv4a43NE/sEZX5qR7c0aAwHZ3EIEqddrcCA2+lUrLcV7rbNpwwZx5SvP3matymIeo2yAvDTL31/9S9FksxuNpfeBxWUjran7A/jPabFE+N4x3tn+54bVXx6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910388; c=relaxed/simple;
	bh=Mj/jc48sV87uDVzvatYAwc8BfoVVAQ4Az5OASSMTFWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fSXvbTTZw7TAV1YovcTyuImtvk9BEJ58Qn1sQE4V1LiBJBr0VDi0LyiUEN/dL3+Mj0pFYdlGI4KVVDC+AObCh2MajIYFys3r9zawam+Q2dRteNIVzFxK/f29WnwPI7motGB1m+lHY7IaiKw1+8axy2lA83EURM/UVexNnqw9m6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlXP6IrU; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlXP6IrU"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso464872b3a.2
        for <sophgo@lists.linux.dev>; Wed, 01 Jul 2026 05:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910385; x=1783515185; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHQ0LcaMXNLnejiZpmBDaHZFQC9wnXmjmMb8Eu8ttio=;
        b=DlXP6IrU3Pm3zXJzIN+4KpIftK/ukBiZAr9xa2C6zdqqUa6muU0gNfTnrzcf33DgS6
         Vz5eRlCfJus3IxLg/UNihJ8VvM06LFq1qfXXhmPlwHJ+DsntUrWnk10zA8c/8aOWftsl
         dgFSQhNQEsKeMpaWlMkFfJ1/D9EJ6oxtJuXAEq2CqddVLMNuHKwxh+xunhkd+7rS4mqD
         xIIXtAQLm/I9NH2/1AJxVY6QrfbDY8C4kWG9BBYW17YjyRo43rtrSMPEHV+F75M3CzR7
         cbvqugmz3DnJ1eOUG4Wj3PgJtIAvX0x6NBbk/hPkoQ9HicqmFIFUUsXoOMTig300YG4T
         NvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910385; x=1783515185;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EHQ0LcaMXNLnejiZpmBDaHZFQC9wnXmjmMb8Eu8ttio=;
        b=M/E6UAaxyc5fuvS+HKj7iN4C9D2yd/7uZZJt2RgBAcHYMM6YPg85WCaQlGcKv9V3pu
         oCCjT1FixXJ6xBE5Nj8c9jNKiAxQnbmZ/3rEvKMo1hv+3yHZK/2gyrgHre5GIaelTV/4
         ChLUIH8p0jxvmwXYZaMYnPgZ36fNDv8Q78hFJZ+XMm6PuqhOQ7lJsolkfTz4fbWHWk5d
         7sVtE9ldYD73HJv0/cfSwBGJThTcL77AD3Gt4LmLiPAlB2iszlPCIQ6CpsyDQVDYo10e
         z4ZQKXT3oOIAgYL6cwXF2hZP1S301CUcUK/bpu4Yfc5ORUSlIO/nHM1QKMKDl4B+o4i+
         7hbw==
X-Forwarded-Encrypted: i=1; AFNElJ9+XBkVSQAT/S9l1eypdGkKgp9P8zMsgXB3H+L0KiANoDU6JgEVDQ3Q3Efd+PW/rez+QyJ69Ts=@lists.linux.dev
X-Gm-Message-State: AOJu0YzH3PmmhHP/4K1lOQB4jingcvEfBDZlMKeq0zq4ABe7tYF8+NyC
	Fv4HL0TPxE+qZhDf2T9ex/hxCWiVZQRIZl6bpnR6TAy5ZYjjn48lA6ot
X-Gm-Gg: AfdE7ckzeud7aElUKV98URZA9p5RtDLb7AvLBErJzq8D34ikbL2XY3PPMvkkVGo0phB
	1GVRRDOQT4lKb3obm0Q62OCAtnBbMkqGR6qeyLR9DsMrnDY4AZHgEd6fy9hA63pvU0NZjwu6ZFE
	IMZx5qbkCUoB2BHQOuUIyYtp0WcXmVWoPyvS0Q9jA5SkYyxhxMGY61lkQ08hx3qEOgt8EKVhR+n
	oLNxDLVscAhnCvsz5DWLrEH8U0mf4inmp3A78iF+7cXMdzSZDKNZRGmIrrt9o0Y5dU378UvyWnR
	TsjpzT3K9yq0+uEiWWvk3mqNtXiqLyIALVtW3lPVKYFAoh+ml8J2H11iXfwauWFSLskMP73AyX4
	Mav9HB4NyG9Yb51+BqM5lAamel+l47bAKZNnS65TOhlioqHHvgj+CZ0oKghLVkmIBg9RR8AsQB2
	U4QffbrtGrL6ahz6Yvnd9L
X-Received: by 2002:a05:6a00:1807:b0:842:614e:cc94 with SMTP id d2e1a72fcca58-847c07c470bmr1457464b3a.26.1782910384742;
        Wed, 01 Jul 2026 05:53:04 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:53:04 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:16 -0400
Subject: [PATCH v5 03/17] riscv: hwprobe.rst: Document EXT_ZICFISS and
 EXT_ZICFILP
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-3-2c61f94a695a@gmail.com>
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
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2247; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=Mj/jc48sV87uDVzvatYAwc8BfoVVAQ4Az5OASSMTFWY=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3mZJjpaMfwwzVXI/rvz6L/tgtcy6pWL2lXrhyT2qs
 1vW9bR3lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwETCJRj+Gf5ueu5RxNO+z0s8
 M0cw7Vlw5erEXQ/m7J4Vf2HuA9Vp3xj+x/R4lX5ZzDh3gswrDceiPfqPlsr5iyi1vcx8+Ev9e2I
 6IwA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

RISCV_HWPROBE_EXT_ZICFISS and RISCV_HWPROBE_EXT_ZICFILP are defined in
the hwprobe uAPI but are not documented in
Documentation/arch/riscv/hwprobe.rst.  Add documentation for them.

Link: https://github.com/riscv/riscv-cfi/commit/302a2d45c2435940d9a63571c66bc038adc74133
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: No change.
v4:
- Update the commit message.
- Cite riscv-cfi commit 302a2d45c243 (tag v1.0) instead of ff03d8485a04,
  per Andrew.
- Add a Link: tag for this citation.
v3:
- Also document RISCV_HWPROBE_EXT_ZICFILP (bit 63 of IMA_EXT_0), the
  sibling enumeration to ZICFISS (Andrew).
v2: New patch.
---
 Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index a09a8f16bd16f..d9928641deb99 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -289,6 +289,11 @@ The following keys are defined:
     defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
     load/store pair for RV32 with the main manual") of the riscv-isa-manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICFILP`: The Zicfilp extension is supported,
+    as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
+    extensions specification, ratified in commit 302a2d45c243
+    ("Update build-pdf.yml") of riscv-cfi.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
   :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
   mistakenly classified as a bitmask rather than a value.
@@ -391,3 +396,8 @@ The following keys are defined:
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
   extensions that are compatible with the
   :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICFISS`: The Zicfiss extension is supported,
+    as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
+    extensions specification, ratified in commit 302a2d45c243
+    ("Update build-pdf.yml") of riscv-cfi.

-- 
2.43.0

