Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836D248AE1F
	for <sophgo@lists.linux.dev>; Wed,  1 Jul 2026 12:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910461; cv=none; b=czbW3ueackFflHPR0BRqY/PPC3BqC/JiCUmtDfJKQHHL2uqWjSRKb4qZNb3FjIhGH1m9DKGUpvSPb42FCWPmZuHClsirPKYv4ZGn91ieCubaeJ7gUtX3ugqfOi4Vaey7YMMXeFQCYwhwXTiQFM/zD88RjO+BJAybGZgp4drpZfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910461; c=relaxed/simple;
	bh=If9Vv8oTlPVOiMHTe3lA0EFHDNlAsYSdgct+20oWDfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TVNYGp2xlrcBB/JRge+ruDFUmQdqmSOG1oqRDQBt3Nj6/rLIpkzbOFtqmhyZapgA/lr5r/M8puMkza6f5aWxIY0w+2BkJwh93JD/A95/uyJgB5uptYA9d7m/8stEmGnWJ/4lRxWvFGdmI8jKRfcs0E4BbmAAJKIF7tNnG+0s8c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UV64cUga; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UV64cUga"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c88cc025f54so302036a12.1
        for <sophgo@lists.linux.dev>; Wed, 01 Jul 2026 05:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910458; x=1783515258; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8K/a6AEhCKKl6b6WVU/a0dv3ErkxxiYJVhxQewlVnUE=;
        b=UV64cUgag55WF6TwHyPZ12ZjMjf8S6C2z5Vi4F4Oj8x/PpELhDyR3Tn4FkTlo+eMDM
         ayJYZ2W5x9dHWaUQSHP5m5lxcOaCgBQnpL02Pulo2C5B6VkZGhY6/G5kB1o9DuhIsQTU
         pWiV5KnP0SGrfNc6q4k3GWZ1TTXaswqqz0oOkvPWxd+4HrSnzjhOpoiEPEEpD5JhCN+A
         R0on/TAGJt6jc++ROPPYXgMLmx1vVc40gYLnPPjpdsd/hldXksKLEYnGql8dSABkMyTX
         N5ylMOZ6djIyrNwYrXO6NJXFouV2hP9uJWU3v1T11FnVmeSMgENvYyQ4e5+JShGWg6ZL
         SIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910458; x=1783515258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8K/a6AEhCKKl6b6WVU/a0dv3ErkxxiYJVhxQewlVnUE=;
        b=otbHGmeZ2vemUxgEiSIc7DBAwfTm65N8XvT90FDXtCpEd+/HhrmnJXtOnrApl+hiLv
         r4ABhQxEV7VxEN1YBxpFxhdBge8pYK6jtjFT9pGwqMXBaHqGjnNAW26Xo+c7+UlP3eUk
         JNSXIrdZM2/B8yyTDA8y7FoxxM/gyymwjNKYtxTQWCMbBDTxE4M3Ywf6xVpDQqvFnSw3
         bg17CBnSgsnYOu9Ym/whUqxWh0oIHaApfxzMeJpVkdLV48fwiTFe6M+eM+pQgNOJzeCi
         r4m5dhLt8dj0dlZqv/oUi6MxPtrj83Iq81irAI9kjCxthCuZdDoHDCMyJMcZsA9HP7Te
         3pqQ==
X-Forwarded-Encrypted: i=1; AFNElJ8IJ3tXfSvsaHHgLq4HXojvgaS6xur8+O8q8kPBnpkptrZd+xHnMZRrNlwZvAkQxPHWokK/UeQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2X4p20RgGb5QYDx9xyY5iIISszEm/0g2R7dookafkmM4IN65I
	5nnBt4UbHHoWtS8ZTwgJOgSJLehDJg6kgmTCGQA9sOTm3Zq07HafenvT
X-Gm-Gg: AfdE7cmzXYR5baVXUDCYBqHxMNC1FZ9bSzzxIj4RfmvBigTy5zWw2W08/k7dVnPRSeO
	wYijoQizfcZyi+K7bxnYUBffJ1R1tvf+aJmfGEg2K7AA4WoGjNZikRUwSyPGjIyCg/ZG7RcRhfG
	Mo/m7OyR5oIm7L/jGBaLA3o3r8VKw7Dlf3Vuip9zezyflDxZRWzFY/QTLF2wFuFxBs2Wn7Sbf8o
	EOjClHDtoW60zBX9g5Q/O+Gh9/5ZraPGo1x4ykoNprUqj0eNqWRSlvPm7FI3fvm/b2bepc0ulYT
	5bBz7qkCOtdGJLm8Gdh0Hph49AniTlr6yVF3dFP7O2cTDUx+yllbFUmOj4JEqQaEFffZWLmH/nW
	Isc5C/q/7CaNljKvmU/kehxzepg1TAmg2oizP3bwAs/Wze8jeio1xaLcMt14QP8VDklqVHNyTm3
	6RDFhLra9QOEsXCHfutPkU
X-Received: by 2002:a05:6a00:27ac:b0:847:99b4:d005 with SMTP id d2e1a72fcca58-847c097d0bdmr1329287b3a.61.1782910457611;
        Wed, 01 Jul 2026 05:54:17 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:54:17 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:23 -0400
Subject: [PATCH v5 10/17] riscv: Add Zic64b to cpufeature and hwprobe
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-10-2c61f94a695a@gmail.com>
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
 Qingwei Hu <qingwei.hu@bytedance.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5679; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=v3bkflKvhJMLJLs8CMo44CCLgRBUGW+Y8dK7sdakiYs=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3tazczNXzLhx5cH0q81iznKfxGu/tW0t8p6zlUOwv
 dw+dkF1RykLgxgXg6yYIsvhoy3ZW1/5RPs+5/wBM4eVCWQIAxenAEwkV5iR4ci3HSE7VJ8F1Efe
 bXjOnabyreTLwwt7b655ZlGtNKm5HqjiwzttdxH9y3MqV0nEMPKERs4+p1MXPcOKKSz56MzUxA/
 MAA==
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE

From: Qingwei Hu <qingwei.hu@bytedance.com>

Zic64b mandates 64-byte naturally aligned cache blocks and is a
mandatory extension of the RVA22 and RVA23 profiles.  Allocate a
RISCV_ISA_EXT_ZIC64B id, parse "zic64b" from the ISA string with a
validate callback that requires each cbom/cbop/cboz cache block size to
be 64 bytes when it is present, and export it through hwprobe.

Link: https://lists.riscv.org/g/tech-unprivileged/topic/question_about_zic64b_and/119631059
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
Co-developed-by: Guodong Xu <docular.xu@gmail.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5:
- Collected Reviewed-by from Andrew Jones and Conor Dooley.
v4:
- Credit Qingwei Hu's earlier Zic64b cpufeature patch: set him as
  author, with Co-developed-by (Guodong Xu).
- Validate only the cbom/cbop/cboz block sizes that are present; Zic64b
  does not imply the CMO extensions (Conor, Qingwei, Greg).
- Add a Link: to Greg's confirmation on the tech-unprivileged list.
- Add the missing blank line before the ZIC64B hwprobe.rst entry
  (Andrew).
- Did not carry Andrew Jones's v3 Reviewed-by: the validation was
  rewritten (present block sizes only) and the patch is now authored by
  Qingwei, so it warrants a fresh review.
v3: New patch.
---
 Documentation/arch/riscv/hwprobe.rst  |  4 ++++
 arch/riscv/include/asm/hwcap.h        |  1 +
 arch/riscv/include/uapi/asm/hwprobe.h |  1 +
 arch/riscv/kernel/cpufeature.c        | 19 +++++++++++++++++++
 arch/riscv/kernel/sys_hwprobe.c       |  1 +
 5 files changed, 26 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index fc68dea397aae..32a14331eb9de 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -425,3 +425,7 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
     in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
     presence of the Zba, Zbb, and Zbs sub-extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZIC64B`: The Zic64b extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 58523b3a1998a..36572c1ff438a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -117,6 +117,7 @@
 #define RISCV_ISA_EXT_ZICCAMOA		107
 #define RISCV_ISA_EXT_ZICCIF		108
 #define RISCV_ISA_EXT_ZA64RS		109
+#define RISCV_ISA_EXT_ZIC64B		110
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 430dc49a82863..36ec8ab470423 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -122,6 +122,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICCRSE	(1ULL << 4)
 #define		RISCV_HWPROBE_EXT_ZA64RS	(1ULL << 5)
 #define		RISCV_HWPROBE_EXT_B		(1ULL << 6)
+#define		RISCV_HWPROBE_EXT_ZIC64B	(1ULL << 7)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 9eee53b264de1..4c3bf813af052 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -136,6 +136,24 @@ static int riscv_ext_zicbop_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_ext_zic64b_validate(const struct riscv_isa_ext_data *data,
+				     const unsigned long *isa_bitmap)
+{
+	/*
+	 * Zic64b mandates 64-byte naturally aligned cache blocks; cross-check the
+	 * cbom/cbop/cboz block-size (when declared) device-tree properties to
+	 * avoid inconsistency.
+	 */
+	if ((riscv_cbom_block_size && riscv_cbom_block_size != 64) ||
+	    (riscv_cbop_block_size && riscv_cbop_block_size != 64) ||
+	    (riscv_cboz_block_size && riscv_cboz_block_size != 64)) {
+		pr_err("Zic64b detected in ISA string, disabling as a CBO block size is not 64 bytes\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
 				const unsigned long *isa_bitmap)
 {
@@ -506,6 +524,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts, riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zic64b, RISCV_ISA_EXT_ZIC64B, riscv_ext_zic64b_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index dcc102bf8f183..3e80e5551ae0d 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -211,6 +211,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
 		EXT_KEY(isainfo->isa, B, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZIC64B, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0

