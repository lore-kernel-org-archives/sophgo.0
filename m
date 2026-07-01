Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D842492539
	for <sophgo@lists.linux.dev>; Wed,  1 Jul 2026 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910499; cv=none; b=sQP2ZJkJknBv/HSRbzFlIuunBCJybgbb2M5eUaGUZLZsAqfIIRQpApetAVTiP9h+wxfRR5VcKpSGXWQQzyBEXjpZs32fcjXo9r5gKncyxSmErrZMoRaFldcJvzt6LOtf7TWzHpjJ/OGMFoHBs7Si0gkp45vruUP0+RCXkT4v1YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910499; c=relaxed/simple;
	bh=RM5/Jm80n8hic83slp8easkNCPyba3jQD85igQwb558=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X2DplH56PMvUY4f+Z0yeo5UvCYfjiI12zU3RNgxdnkKsHaVbV6P3gEY578D51M+CR5+VMpM+VFGoD65fQq/svppIVbUnk97I/NMrzBS886Bei61kM1MP8B/0VSY7iPZz5qA/BDkhxmSSaD8TS2cvghQIY5tunbPtkBZbhf/g1Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BSEQv0+X; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BSEQv0+X"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84780c95e2eso356278b3a.3
        for <sophgo@lists.linux.dev>; Wed, 01 Jul 2026 05:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910498; x=1783515298; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F4itvwgmIkfoT47xsL7nDKqH8kqk6Z6HU3EjYTAF58M=;
        b=BSEQv0+XLa/4wJV6zClYv4rW27HIXWp7IrbkwSe3L4VD7K3pu1+FGmL/MatEg8baVf
         hJ0eBRj7zhOatFUGlBLRtZisqRZOKr/v7LyBF1h88+abctSTkmmAgIi2qj/oC/dHF/zd
         gi+qgJpVV18uym4ziDfo7yfEZckMdaIjHvqglv9rVyg8V4Vtby9Cb2npMixYe9UxD6ME
         FX5D3PPLc9gVhjrX2cANdCnzBvvOMtT9RJLQD9A9+qHe91q7Z1yDwzGj/gqghzuqxPMU
         ktAtc5Y8MUEoTf0WkUa7QXCNNopE0lTfCNIRyeu+xatuAKBs5Z0bQ9EinrH7oCr5fUK4
         OZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910498; x=1783515298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F4itvwgmIkfoT47xsL7nDKqH8kqk6Z6HU3EjYTAF58M=;
        b=YKOwiRpIKpYAL0qT+0gFrGFGxacPaLFMRnrY/45z2lnRBVYgrhtfba/fO5JCdFbcuh
         ZRRl9cp9KmM2W+rsYY3skDwamz8JGkWIi4RisMq6CxouWVkpKGnpL2SkpZi3jFciT4Jz
         H7U1avbxPuQQoC9Tc8xbnxGglXcpra1hJyA05ta+nd7YM94r9eJ9IAOLwc9ZtBtm37+7
         iDo0vQjbijirIzvDkcTxskaiurieG4b7D9XACDioWZG6iCZVLFHwp/LjOoFChvfoepLi
         r6dKuS/CmMeiQ+pT6RY7S9nohqpkXmuNtkkMbXXB46soKLWWOUPq2+Aa6ZbBZFQ/5y7L
         qTfw==
X-Forwarded-Encrypted: i=1; AFNElJ8u2QS8ATIRmBBGGXCRYq6/mLbilqOFGIrm8ssHOf7vLw9M2DvtXZdqkphl4952qYf4Q+Fsog8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyuPXd18xEeAUMkZKfM8/5gBf/KZWfBnme4BpHU4RCpr4YpUKHi
	09zB10i1BPR5tQMWqzeKNlby4q2LvSie+cTOjr95/X+u3XowppqI3e/+
X-Gm-Gg: AfdE7cn3bfGspB9BSFX/SsBE2zX5i2B+Fv8L1wdwR+pWXa5YsorVoK/eUgp2PcLr5CG
	n66UvFgia38eImH20tRJfGwETtggZ68NPB8K1bBQ45FYzU5WD6j2QTp6P9/KZBfduZqBuXHEqrE
	UMwA9aDhpwvikaLTLuswBO4a6Fr+t8Oa2+V7kJ4y6kjRzY6wl59tGrP2zqAJgrfit9dUdQ4sMIa
	Pnj9eZHSYqoNlQDtOQnv7cPqXIVxot3qpisDGP0hj0ylD82QtpO+XCMX42wVOrbtdRi7eMKbtzn
	yZmzb1VOhcKRr1ujGVOYVhgOl00MM4Ic5TzA+/wsp7y7Qx8u9eSbTpZWR2k4gaGbeZf1VizSbqS
	jsyFVUDmmbKMm+3iuW1d2tr+SnobUNfttz+0fmnnvoz9WJsNj8rRNpjLV3RrhkCskUzGL4XkOmB
	Btj6g5xg9b0JUm019+963L
X-Received: by 2002:a05:6a00:44c6:b0:845:e105:1e6c with SMTP id d2e1a72fcca58-847c5235e15mr557323b3a.62.1782910497562;
        Wed, 01 Jul 2026 05:54:57 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:54:57 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:27 -0400
Subject: [PATCH v5 14/17] riscv: Add a getter for user PMLEN support
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-14-2c61f94a695a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1943; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=LaS0cxSQXBgyR01xQr5M6KNsO7HDlsJSbaq9hq8ofFM=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3jaJs1we53hUJftu3dk5Y52sfn0Xg+vbEK7Om/tuL
 zAvnjqpo5SFQYyLQVZMkeXw0Zbsra98on2fc/6AmcPKBDKEgYtTACZizMjIcGpvd2B4wjVF7TIX
 h1/fvitwee95mTC3Iqiy4+QF5p0ycxj+aTkoSGYs+z1b+51NUvTHg/+rd8dNWbVvxirV3Wy6Yma
 ZDAA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Querying whether a given user PMLEN is supported is needed for
RVA23U64 base detection from outside arch/riscv/kernel/process.c.
Add riscv_have_user_pmlen() to expose this.

Link: https://lore.kernel.org/linux-riscv/rfuwa7a3ebe76udmnwyrssjy7shkkgxntvhwzn6oquysj4tuyp@xzvpylcfhz53/
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Guodong: replace exported booleans with getter per Andrew's suggestion]
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: No change.
v4: No change.
v3: No change.
v2: Add a getter for user PMLEN.
---
 arch/riscv/include/asm/processor.h |  4 ++++
 arch/riscv/kernel/process.c        | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 812517b2cec13..febf51e127f70 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -214,6 +214,10 @@ long set_tagged_addr_ctrl(struct task_struct *task, unsigned long arg);
 long get_tagged_addr_ctrl(struct task_struct *task);
 #define SET_TAGGED_ADDR_CTRL(arg)	set_tagged_addr_ctrl(current, arg)
 #define GET_TAGGED_ADDR_CTRL()		get_tagged_addr_ctrl(current)
+
+bool riscv_have_user_pmlen(u8 len);
+#else
+static inline bool riscv_have_user_pmlen(u8 len) { return false; }
 #endif
 
 #endif /* __ASSEMBLER__ */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index b2df7f72241a5..5d9cb108a6232 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -302,6 +302,18 @@ enum {
 static bool have_user_pmlen_7;
 static bool have_user_pmlen_16;
 
+bool riscv_have_user_pmlen(u8 len)
+{
+	switch (len) {
+	case PMLEN_7:
+		return have_user_pmlen_7;
+	case PMLEN_16:
+		return have_user_pmlen_16;
+	default:
+		return false;
+	}
+}
+
 /*
  * Control the relaxed ABI allowing tagged user addresses into the kernel.
  */

-- 
2.43.0

