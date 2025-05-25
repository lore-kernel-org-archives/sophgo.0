Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C0D1F8EF6
	for <sophgo@lists.linux.dev>; Sun, 25 May 2025 14:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748185192; cv=none; b=VITMAplI2Im8U7su2X0JJGV/1cQGlF5e/q2QVdBC4u0t3c4tC14QJI41h6Kz6+3aUxS+FN8VO6HVyrmCFIIRsQirnNWD7KB/6xl2gnBFS/t9g7+qGd8y6E5uibtfxN03UqLQ2xfDEU703fUx/GurZeBHnfFzUPPgI677c1R9qtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748185192; c=relaxed/simple;
	bh=1GDh0zAEry6mVGUqkPUqxMLAqpRze3QvTZVNyNvZNiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=teFEu3aIJXg4V7t7S+po50hvuZHycFxZz9oaa+I9LgnXIZleDKK1Rqysr5OBRohA96OSiRGqiCQHZXgf6vwm7hPsTSvIiAIeY7t6rcQ7UwmVk1BJAYGaaJhVAANGhQE2ZF8VOpJkPm7B4AjsEFc1vhi8pPnF8UfldTjnTJoa0mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzd0FwYZ; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzd0FwYZ"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b26f5eb16a5so984112a12.0
        for <sophgo@lists.linux.dev>; Sun, 25 May 2025 07:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748185190; x=1748789990; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BxmiZPl5Ck8pukdGXQ0/lqOM6oa5lUIp5yTgqKF3faw=;
        b=bzd0FwYZWMkrtgsVKiaPKSiWqUZc4MDtX9RcNhg7cdFrSdGOEO7/Pn3OnYqQVs4HSm
         tkKySjab5cfWFzXHDx3/JILAn4/x5m64GCP+eMhrlcmXWy/PtpCSEi09hf5qmEFbhaoj
         MITE46maeRYxfL7SP/Tii2vGYKiv+RC5AV8m0dMLbfqIpbVzzQ7ZECbevUvU0MX+omQy
         CWdjhZl5HavyBjXf5wKiDsr2UfKm2JSEfiwAuuX125fBqTe47qljuWoAuIgmSrns0UCf
         7Y9rG2eGB7saFLkNnNON1Bdn6LTuFbLhNuO0hhuYnU6fsPVSK/Z21l1cFd4/Gj8jxpY6
         93iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748185190; x=1748789990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxmiZPl5Ck8pukdGXQ0/lqOM6oa5lUIp5yTgqKF3faw=;
        b=NxTfGmvKQzSkkiquZank7KKWQTne2gS+QSOnz4ELdJqdeox8lOLCcaM283qq6uHA6r
         cjFzgKPH0sZnRi0RadkDEOdFlgrowpmvGur90p+ldMHGpUFevBzMgJqgLPlIuRD2hIbZ
         Va6FfNfKfzxrDMuMWv8XTQ04zY5AF4lK15dqzrTaBa0bwniKXQcGjX1YfNtnNhtTq89I
         bDSSGK4LxnT9+tAn1e0Wrui446kLpIDtt9Wt680+3cJhT901CdWaY083JeLLkBz1jxq7
         3EISeMSTjY/WkQH6DXb9zNZhnhFjgpASnihdt9YXLO2fjOSDzPGP3rapxm6c/fuJbPDF
         WXkg==
X-Forwarded-Encrypted: i=1; AJvYcCVWROGQoeebIqaF3W5rMX66/Lc1rrQSK9Ty9NJKSPYrb0QlP5A9TwZRSy0RTkD6LtlSEkmmopc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7m18rpLcxdPngzJfISiE4Lb3FdkzVjBZP2nYVFDxbMmIymUI8
	hAPgM11ugqQYtXSpa4N+/kJfA3eSNvLAlOEC0UaMwdoKdmYO9dPpV8FP
X-Gm-Gg: ASbGnctwhkrQg3XYklUIxX7dOVLhCN8lW6enq84Q8VGUUftZvkTOLP3zw9wkU90LbNY
	bSaO36sq+TFt74JZ0RWeYwD3WrH3bJg08GZigb0OmqoUDbVeMA08drio63YJn+8VwmnoW7CVNoK
	R+PPNKWdjswBwswAwjZG/mmyHE19qpbHVM74JLh3NqcqQKRYViKcuim5wX+xkuPIAncXFkomQCn
	j8Qh+O+63PauI/fRHF6YvVdgNk0o2vaPXLvhEG49PfwsUtEqdDEqwSf1Tqsq5gwFZ/rWRtNiApu
	kio20bcFKKaMd8o2g+7j867pAxHjrqzVHpoAG1IbylI=
X-Google-Smtp-Source: AGHT+IGunpP59ynpyV2hBlZb/lg+XTXK4YdN1s4v9vrB00vwAMIKxbDWsG2m36xfm44uu5CUSMBefQ==
X-Received: by 2002:a17:902:c94a:b0:22e:23c1:d711 with SMTP id d9443c01a7336-23414df58fbmr94181685ad.16.1748185189378;
        Sun, 25 May 2025 07:59:49 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::3fc8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2343f8e2fbesm12204845ad.250.2025.05.25.07.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 07:59:49 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Sun, 25 May 2025 22:58:43 +0800
Subject: [PATCH v2 3/3] riscv: dts: sophgo: Add SPI NOR node for SG2042
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250525-sfg-spifmc-v2-3-a3732b6f5ab4@gmail.com>
References: <20250525-sfg-spifmc-v2-0-a3732b6f5ab4@gmail.com>
In-Reply-To: <20250525-sfg-spifmc-v2-0-a3732b6f5ab4@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748185167; l=2232;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=1GDh0zAEry6mVGUqkPUqxMLAqpRze3QvTZVNyNvZNiQ=;
 b=pAjTR2y1Jyl1kOT2HIrGue4nOoASxsqz3sFfNJmHw8RhUwHa6kMtiZX2u+s8DVtmQlF8uG2Vd
 gFPcGRCfky+AG7+eNwNKD529Vou0ucmxp82i1NihK/sy7VEEbG43NqB
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Add SPI-NOR controller and flash nodes to device tree for SG2042.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 18 ++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 24 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index 34645a5f6038389cd00d4940947c6bb71d39ec6f..c59a819e35d3201c484bf98392aec14392a7eb04 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -68,6 +68,24 @@ &sd {
 	status = "okay";
 };
 
+&spifmc0 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+	};
+};
+
+&spifmc1 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index 212a3edc73fd654de59e10fab2094af2fec7f88f..06b433d5949bcc2374ea90223ff2d81434fad2b5 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -83,6 +83,30 @@ soc: soc {
 		interrupt-parent = <&intc>;
 		ranges;
 
+		spifmc0: spi@7000180000 {
+			compatible = "sophgo,sg2042-spifmc-nor", "sophgo,sg2044-spifmc-nor";
+			reg = <0x70 0x00180000 0x0 0x1000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clkgen GATE_CLK_AHB_SF>;
+			interrupt-parent = <&intc>;
+			interrupts = <108 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstgen RST_SF0>;
+			status = "disabled";
+		};
+
+		spifmc1: spi@7002180000 {
+			compatible = "sophgo,sg2042-spifmc-nor", "sophgo,sg2044-spifmc-nor";
+			reg = <0x70 0x02180000 0x0 0x1000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clkgen GATE_CLK_AHB_SF>;
+			interrupt-parent = <&intc>;
+			interrupts = <109 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstgen RST_SF1>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@7030005000 {
 			compatible = "snps,designware-i2c";
 			reg = <0x70 0x30005000 0x0 0x1000>;

-- 
2.49.0

