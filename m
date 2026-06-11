Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7833B37F725
	for <sophgo@lists.linux.dev>; Thu, 11 Jun 2026 20:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781208809; cv=none; b=YD9rcO4JAmIoSuw5PaxiZuYQWVGCvX81/2gY4EIfza4/oRgXrZeTaeCqnF0ANowqj+fDcnlQ90DmLLyt+6SQk/QJ/qfX+g0E7GqBFW4Nf+hgSEpBEqS3FfphF5kSHO4bGGAIu2tpDMnePOTTDoppCVKCvPWviTTUA7lk6O1wLLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781208809; c=relaxed/simple;
	bh=q/QLrWSGJJhQtCezKRc6txtE+UkVnOpKgnOg6fjEGdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aiLRJzDt3Wvgwhj/w5QpRoYoJtv6p0MUu0BDMaoRGtxLWdkMK9I06BDGe5JwTku1bdti0tgjOucyxiE5mK5LyGDAkZbcqG3WeILWYrZKfyQVeL4i7th/00ETw45yKM5m/7Fo3RQx9nZloKFtjDYcvxOt4kH6UygzWSiz1HRVtHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMVq+WwA; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMVq+WwA"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0b9328c4aso2551255ad.0
        for <sophgo@lists.linux.dev>; Thu, 11 Jun 2026 13:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208808; x=1781813608; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gm44aTTKOxWn0lKZi70AX96tEsXQQm8LgJ40+/hEF0Q=;
        b=LMVq+WwABscr5z7kCI9Qw0fxa/4vN7csbypZhZyoJqOrYVGTHCYmHWNXHEDCvyEbxv
         x90lDgtEs5kL0g1E8BYHmRqF9Yl1sIBkFMLLWvEVC+SbMZ60aJCCmyqVuH9JbBsZD9YB
         WdVpl87cevGtggQHL0r8AHVaeEoO58ogMFDUjw8kav7wqw0KnArwJGZB0TpciElbS5TY
         5TCIoWYcvVQINueKq6VfnElxvU2oFL2HcsSe5TQ93QV9k0qyUpD7BN3zc7DUiSkkJ+q8
         ni0JhdniJ7utgYmuWlx+zHST56rrPvb4OHl6Z57Vmi9GLxRy5BRpcZC3e72AN60gG/iH
         iefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208808; x=1781813608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gm44aTTKOxWn0lKZi70AX96tEsXQQm8LgJ40+/hEF0Q=;
        b=AXpzkhyq1wJpkY4+iyRtNGFIjsuvBBTllpHg7h4QrCLAc6YRGGVRo7TcIqpZTOxJGg
         ZZrIWJv6a7thXE2IX1OI9FHtgrqStfXozcICtqhCqdcfnfHh1PhGXBrumYsZm3NUF4q2
         cwTGv6NwgUpx4FOpMdh9gLGd0RDwcxuBl93fgOc01LYsCp5geEUI/WJO/xrRRTI0AkYX
         vtR8+pY6ZMHWucyjlETazPGxhpwid3NReJFH6fdw6RfOdL0HJPYUtlmFgRTDP8cTVW+U
         NKtbVROO/llzfgdT9+ZASAy5ufmWEptOd7E9Tfyfvu76+5ti2C01c/+8H5SF7To5ZsWR
         p0yg==
X-Forwarded-Encrypted: i=1; AFNElJ/p/UFElKfDAsrQ9BZyAOkm7vbg2w6PLNY2rY7SUoQmWUtN2Qze06mozq9DF1fk0vXEROc2VnM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEFIxBQ2FaJj+R1PWWxWdfuycLzBYzvX8DTmCQHD8HH/WHojWp
	C0j+ABbPwcgXSG/nVwDla7Gjq+dMx8Y6OxPAEuGaGKSqfITZrkGfNJCc
X-Gm-Gg: Acq92OEFwHmQWXNtYHXhnoddzjwloYUbevo0rjfkhJ7Gc/EYBrFG3RGbYA3NBlgIOWw
	xRBRel/Q2gZSbMGxFpQnpIT41UpGOzZeZA+rSL46Hf1o/3srhDUnVtHrMAi352lz1uHtbg7lm3/
	RzyfbPdm9CAedqQNXortIBrO5tB6bsFKoJOCMGmLpc2l75UXRk8hcJd8FGiwaxDpucdzyf8U4Wm
	HpVPVNcpx5TRfpG9tc+Ty7oLmmTAM8uKuwUqXgMKkVYrbAWTbcE8ECD+LG+oywOzudp/p5kiluZ
	S3nkowT5aZ7wJlNJtsuLOSzM6SEDmI1zabKbUjzo95B2s+MRHbHlWU1tJkNghOxU33QsGVzyMwE
	XGnok5jVet1QWWPvjjGdExgeZQfJbi6Ofzja8DDC0+xFn4O+viDAg69SobjMFwBIOF4AAhvgGxQ
	==
X-Received: by 2002:a17:903:4b46:b0:2c1:6259:cda8 with SMTP id d9443c01a7336-2c2f22a9f06mr51888325ad.25.1781208807828;
        Thu, 11 Jun 2026 13:13:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:13:27 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:40 -0400
Subject: [PATCH v4 03/16] riscv: hwprobe.rst: Document EXT_ZICFISS and
 EXT_ZICFILP
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-3-3f01a2449488@gmail.com>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2231; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=q/QLrWSGJJhQtCezKRc6txtE+UkVnOpKgnOg6fjEGdI=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtsQMhX89b/jK+JCRn0MornigW9b3hyMPzwofO+E6Zo
 OCz7+rMjlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZhIxBeGf9qm976639f69W0V
 w+nNF3xEdGem/L+z0GGNnnNgRX2FMgvDf7dtpZJc33bcTb0lVM65UDi3+C+rk0eI372LQmZHZb7
 e5wMA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

RISCV_HWPROBE_EXT_ZICFISS and RISCV_HWPROBE_EXT_ZICFILP are defined in
the hwprobe uAPI but are not documented in
Documentation/arch/riscv/hwprobe.rst.  Add documentation for them.

Link: https://github.com/riscv/riscv-cfi/commit/302a2d45c2435940d9a63571c66bc038adc74133
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
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

