Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490D31F4168;
	Sun, 16 Mar 2025 18:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742151412; cv=none; b=FQGMJ4qxAD2cv1SGm2G5JZDBJSk30Rip+iD2hUhVpEnVr/o+okZc9KNlYasdargAg2sEHzpl1W68jNnJfURdS6btYD8HN2Vnm2HfDB/qis9Q8SYbtTGiwYrlgKU6lHRhIVIqJGl+GGCN+NqqCnqPtAGdRCTAtTB6cEQwNqw59BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742151412; c=relaxed/simple;
	bh=gJCXdAP5WKpnMY36ih9CkYJ7JDM2XKjyt33TAw9Xm3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Li7lWC8Y8PsSUck1A3bZ6+vN52FXXH7FY3TNUOrVJOKISjBm9dAaDtcgj1QId5qy35LSLsb/llIZZMr2ay3+n2nFoCZw/iFhQP8dgGmmO4pm0Wy4TCkTwvFPG/oybln54ljQRuHQ5WXuMjfGGHYAcBCGMbHVv36uvICeVix1omk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+RnTBNM; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+RnTBNM"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d0618746bso9907815e9.2;
        Sun, 16 Mar 2025 11:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742151409; x=1742756209; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byzeZ9g+q+OgKNQAbtO6VbDB8pMI2PIP6vw/GOpDXCs=;
        b=N+RnTBNMhsNEro/CSEdWm2ky+eWjJOerCGSYfxUuVYjJsyGVTa/7pr+wLde6SqgFAD
         yVhH2UX0VaxVA/QZPK6V7r4PXzV3xKTobpOsZYB5TXfCbb/nhVaUuJOzwV5WEESFl4Ns
         A7pl9xFmPh692TKTbjibPAc3tA957WTb8kSRpEA7/wr2dWVZ/jMoaMqISyFNOBdWu1+W
         Uh1NY7n6FyAS6t8LUaAMnO7soOaRQxKJk0avMjETSAOIhNHpnAm8K3qrQW897Q/gF9R+
         GQqWkbmBlJjiX02bbetz6SQqTv0vxSJcuwmOtHc+68YGcMF7lf/7IdVrVAHL3lrF6kNV
         cUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742151409; x=1742756209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=byzeZ9g+q+OgKNQAbtO6VbDB8pMI2PIP6vw/GOpDXCs=;
        b=qeXZO3EO2Aa7kHuofNyxE9JuYp8WyeqvTvL3o/MYkKaI3vadefRiMcGwB5Q8WIWFy1
         SlnfsxOPBE8YqRyshOmYazXPLoBQgqotbCTuu3EFAHebOSra3JwojMQRyv9stbNed7UQ
         WqlN7uW+ObvnXU0EZ9Lkm7RTq0lMXgi71eUF6M8IPOt8hqE0SMg0GE4vef3TKpB4/8Lx
         SOBB6D5aSD1NH3IHKNS7Ef4Rn3eO7u5mvmvOjjNqdg5rP3fWTyujdpY470HL7tuvS1Pw
         E4DQjNVRpqo2m8X9uCtmOPMkrnoU7p4vvPiy+MY1+T4VFA0PgChrfBAoHBME7VHSxYzb
         OIkg==
X-Forwarded-Encrypted: i=1; AJvYcCUyjyw6JZulBHMBOsOM5t/NYNHn1V5A66ynF+y2IUhUkABY9smdnx91qDJW+BKIldNSutU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxA0IORrWDugJoRsBuyYJmCXaJ91qiMvwJBqKbmYKx1qf6fj+xd
	SPHY4ZIJXaB9EqpE18b1C+o1jofu2GfusxTOwCWpd9kS37rTmVXDyg0ft+YQ
X-Gm-Gg: ASbGncuibigt28zmjEvwMGk6gr5xmQQyVI+l9PzdTxnv03Wb7nd8sS4U4mWHqsa4uFx
	PfkKNuUIFjKhvr01b6BakNiof2EMSVSje8uBDPM/dlZwvLP2LpEN2jXJ82u+z9C5D1GNmGV3j1b
	Ek6zGQrR9af6kYLyol3DqfX2HLcIwBHw9MUoKDaIINKAXSk0F+gvaX+kocob4LWNkYDomvDnTni
	JZCfoXSk9ebqHUXN+nyS8mV9CQOUfIDbp21+/gcIxxOXaursDSfzfcgDS0+PKu2AqHHufUqDP02
	OaSY+mQnSxw1PiuWBlYoLHzW44+RSCxR/OTj1yQDW0YvtNTG3BfVbPgKWQ==
X-Google-Smtp-Source: AGHT+IHyIAsL2flJepwd1QARIIgbCY/AczwoRosR63EIuqAqBvEyZG+kPa3KUxlGVA7o4JyQtrlAcA==
X-Received: by 2002:a05:600c:3c8b:b0:43d:94:cfe6 with SMTP id 5b1f17b1804b1-43d1ecc7b28mr110788435e9.16.1742151408488;
        Sun, 16 Mar 2025 11:56:48 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffb6292sm84692335e9.1.2025.03.16.11.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:56:48 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 5/7] arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
Date: Sun, 16 Mar 2025 19:56:35 +0100
Message-ID: <20250316185640.3750873-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
References: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Duo Module 01 Evaluation Board contains Sophgo Duo Module 01
SMD SoM, Ethernet+USB switch, microSD slot, etc...
Add only support for UART0 (console) and microSD slot.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v5:
v4:
v3:
v2:
- sorted all nodes according to DT coding style;
- added "compatible" property;
- renamed the new .dts not to use underscores;
- added status = "okay" instead of deleting it;

 arch/arm64/boot/dts/Makefile                  |  1 +
 arch/arm64/boot/dts/sophgo/Makefile           |  2 ++
 .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 31 +++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 79b73a21ddc2..3a32b157ac8c 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -28,6 +28,7 @@ subdir-y += realtek
 subdir-y += renesas
 subdir-y += rockchip
 subdir-y += socionext
+subdir-y += sophgo
 subdir-y += sprd
 subdir-y += st
 subdir-y += synaptics
diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
new file mode 100644
index 000000000000..94f52cd7d994
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
new file mode 100644
index 000000000000..b1f8a5787861
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "sg2000-milkv-duo-module-01.dtsi"
+
+/ {
+	model = "Milk-V Duo Module 01 Evaluation Board";
+	compatible = "milkv,duo-module-01-evb", "milkv,duo-module-01", "sophgo,sg2000";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sdhci0 {
+	bus-width = <4>;
+	no-1-8-v;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	pinctrl-0 = <&sdhci0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.48.1

