Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C13D3876CB
	for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 23:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768432792; cv=none; b=g6Cyc8DOUaWdg3fiUnIwVB+7Cn+TvASFcKi1ymMPTrWRgJCtIb8SPkAbokdSiZSsgHjp6Wv/Fn921hWXq3kR2UMCZDjFjaaJy25zlKAMOVZYeZXQcqzyZMGTQJxeH+if0pfRzPY8I9OfyB7T12qMBbLLN3UE1A49NhOjejE7FjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768432792; c=relaxed/simple;
	bh=ZZM1QP+Et5t76bj+vYFHGRMpEEDgGnkMgqGYAJgMERs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gt57vEJWxhY3LVh4CSxsvjtGQR3Ut+kYa7WPmYxr6btMZaR3Frij9WxoVqqNymS7+S8z7lGMLv7MCD0/bkg1sRQ/J603N3EIhq65TeTz7bFd9o14P9is1J3W08Lkhpwbm2CJgSAza3x9XSo91YwQL4Z/dr8O7WZwgVjF/J0qUMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=AZ8K4THG; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="AZ8K4THG"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29f2676bb21so2959405ad.0
        for <sophgo@lists.linux.dev>; Wed, 14 Jan 2026 15:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768432776; x=1769037576; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hH2fdyuJzA/r4nCwD9bqyqAYCMVx76+tEK4L4ktZ6KE=;
        b=AZ8K4THGiprcTKsuC316D+BG/rpW7JKelL3m03N5wG4VKtgMqjICyAtljmmKRnXlxU
         6PRF00ZpBUVjI9ZfyJeUdapfa9lPqTMRq7LDVCb+enTOWBRfJI7HzOazUOdwMzmc7MBm
         qUZOxBV0wTb5xGikNLPjrcmVUJBX7gttXyS0RkP30qZ9XV1m6QbOYd/murxvr4/Kaq6m
         uZCEwu20fgJCMEDxojsW6oK19PWyvBZwd8ef1kZgj6U7tOZQ/BpeWOriyyPyyUDOPNlt
         oZ1TrBnJ3p0LJ2QdbqXz4KJ8C6DmOmixLq+jjWV0kuQGPvXUJ+TL0jrujje9QG2x0OqF
         v7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768432776; x=1769037576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hH2fdyuJzA/r4nCwD9bqyqAYCMVx76+tEK4L4ktZ6KE=;
        b=nG9mDARnySfpKhyiH94orvdSb07U/Ae2/jiO94MuS35+LUedRuh5MlCtcmkGTHpZw5
         ZFKvX0hK6gPBs6AjhX2Vqv3UaXdn4ihynVjPf5JDEGqFmh73JTz21PK7QLbfoAEfTnjS
         b4h0i6JGUORo4NzwoKQrjgotg3YeKC0EPN3KiGEHs6z4G9DmZ7iIhKU0ZnyCZzX+gwQu
         qR9eN1RFpqgU4sZbDRV+Fj4eJVXmYIBqZ/YZHj9uInV23CKeFA3AFsyLyoa42LvLokOg
         WJaslEpFdzx1YLsrS9JL92P46qVq+8ICZj7a1KL8xj+SY0rmNRzJHmFxWct7MeQMfGli
         G8wA==
X-Forwarded-Encrypted: i=1; AJvYcCVgrfaVdJtGRwENwONdTRcQuVjO5y6lGAN8H2lPV1gy80lH1vFpIh4ji6g40OXa/VKHPQ8xKig=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+o9cfW/jxWrZHlKMV0w2NyDmI+M6yx9FyH+i/iwz1c++icjlP
	sWeLQtbPjBAMKhZINRi+55L3RtZbNxd8Zs2livccVjhnPmyn987U3vocjPvzz5rh4nI=
X-Gm-Gg: AY/fxX6BKv48O7RVkd0b8lJsBVgFYrqldP0Gk8LCRXvJuu+Hl/fJMFwzrFPvvGVW51+
	2fRSyMVQXBL0a0Y/lSom/9JUaPqEuBkhXa2RLZtaX1d0pPKKcZiF3ql5ueQXUtfnz/Po0vs6rFN
	gS9EpvWHhSnGnzt9An662JAOkC8cmtonWVD8kXyNEOjXGMyb2JX3MIIfxOuI0czswauq2/eGrPv
	f5n5M5Aaqg2+mYY4mBC/kXwtbM5qUV4QZrMev0myNee3hIWENh4uzlb+J1gdGj7ckA+oQGTwWSE
	wwQLNb93oJKb2izXwQd/1oXL2lcto8uVwx9/r9NafFOIlrn0aXEXwkma/YmLAwjh9WwXqsfo4Ja
	37zuR6nsX4b3lqAE37K++Dh3wrYDNDrZGw5gI4zegiEg6k23itfZIT6RcKusjyK3r0tmNEcCN33
	cgyLIn4kDKcygZ8YadhRvoTE0KniNda3MtYiaBHI0KMcb8DlXm2OsY7A==
X-Received: by 2002:a17:902:f68e:b0:295:543a:f7e3 with SMTP id d9443c01a7336-2a599dbf680mr41755545ad.27.1768432776367;
        Wed, 14 Jan 2026 15:19:36 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2d6csm238591755ad.64.2026.01.14.15.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 15:19:36 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 15 Jan 2026 07:19:00 +0800
Subject: [PATCH v2 4/4] riscv: dts: spacemit: k1: Add "b" ISA extension
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-adding-b-dtsi-v2-4-254dd61cf947@riscstar.com>
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
In-Reply-To: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Yixun Lan <dlan@gentoo.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3

"b" is ratified (Apr/2024) much later than its components zba/zbb/zbs
(Jun/2021). With "b" added into riscv/extensions.yaml, a dependency
checking rule is now enforced, which requires that when zba, zbb, and zbs
are all specified, "b" must be added as well. Failing to do this will
cause dtbs_check schema check warnings.

According to uabi.rst, as a single-letter extension, "b" should be added
after "c" in canonical order.

Update k1.dtsi to conform to this rule.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: New patch, a split from the Patch 2 in v1. This patch is for
    Spacemit K1.
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 4c045da95d72..2917b315728f 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -54,9 +54,9 @@ cpu_0: cpu@0 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <0>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
 					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
 					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
@@ -84,9 +84,9 @@ cpu_1: cpu@1 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <1>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
 					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
 					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
@@ -114,9 +114,9 @@ cpu_2: cpu@2 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <2>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
 					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
 					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
@@ -144,9 +144,9 @@ cpu_3: cpu@3 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <3>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
 					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
 					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
@@ -174,9 +174,9 @@ cpu_4: cpu@4 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <4>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
 					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
 					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
@@ -204,9 +204,9 @@ cpu_5: cpu@5 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <5>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
 					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
 					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
@@ -234,9 +234,9 @@ cpu_6: cpu@6 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <6>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
 					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
 					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",
@@ -264,9 +264,9 @@ cpu_7: cpu@7 {
 			compatible = "spacemit,x60", "riscv";
 			device_type = "cpu";
 			reg = <7>;
-			riscv,isa = "rv64imafdcv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
+			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
 			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "v", "zicbom",
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
 					       "zicbop", "zicboz", "zicntr", "zicond", "zicsr",
 					       "zifencei", "zihintpause", "zihpm", "zfh", "zba",
 					       "zbb", "zbc", "zbs", "zkt", "zvfh", "zvkt",

-- 
2.43.0

