Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4513AD520
	for <sophgo@lists.linux.dev>; Sat, 30 May 2026 17:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780162532; cv=none; b=KzSMPy21Q9G/xDDVMdrSazf7zEnMI0clKdL4mPjX77LnOMEGH3UvYoToZ1qHJjcoJRdUYmxYt8QNMAVoIerpxLOYHZOZIBH3YyuUVZbQ6kdygEwgiIikmkDe8OS0BcmsnRKEGmgopuG6H+LTDNdPBmzH7uDJ70zTIKS7nxpBnKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780162532; c=relaxed/simple;
	bh=VJhjDbD9k93v4xWoMfUMeJOvaM+SAKtvPHI+Ks7kzIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GaKWd/gPenpSe/qsp9vX9JvkPVVg85hF8apB95zxPS6cePhnikkmU01b3dohpow9vwf2AUiDooJRd5pLqibD099SWQP/V+8cxF8deb6HFPbtSBv9hUXSFrrMWj+78WLD/HCW/G6uDC4rKlEPr+cDgBDL7cOk7u0mue9RDIMDeYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cicGdl3t; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cicGdl3t"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8cce87d7995so21356636d6.0
        for <sophgo@lists.linux.dev>; Sat, 30 May 2026 10:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780162531; x=1780767331; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1iXfEJhkoJc89mTL/JJu7oRdlYA/T+hX/oQJz+ARaI=;
        b=cicGdl3tX+LHFe5Y7kkYrSUsK0Pazg9ZquPBrqoDjA6rylp8SrTEYJwLn6NUubsXK8
         zqk3dubgO7xRO1QCgkD2BE4wRSOaiOP/qRCgeu8ljYBYQG1omfkq0iGR8f4yEtbwrDLj
         EnILuQzX6M+YX6xc1hBQE931CHK1CnEzq4vCxYS9Kdrt5eAG5SH3XNucYiNtGTwX+1gx
         XC68mL6EsE0PBD8tBkh3UF7cEtNh+exPOKMenNTBdY7D8epDiBY2el34xNxK+cLgV0OR
         bAEQmAwmQwJ2CRTX/j4YdBcGWM5bIht1aFCM+Il9aJkiQjJ5w59MI4kuakgGWPLZvNXu
         OQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780162531; x=1780767331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e1iXfEJhkoJc89mTL/JJu7oRdlYA/T+hX/oQJz+ARaI=;
        b=PFIX8cDkti7ZzgaNFjKQm1Ht8RV2B89o/M+S0mHtggM0Yf4ieHmbq6JzrTiwO+iixi
         08t1Dg6zfYBbsWdUAS+N90IgQtIxOwVD37TcBgyEfJZShGq0NyjPccbsS6lHMquHnhQI
         4t2//8FP7h6JS2v8/G7mNnjgMgi7CXGaaY0dLZalFqKwxnLZezTlPDfwWmltoAimLDy5
         cLMvYmlIL+QNR8OMRI+TqvYyY2VQAkIzStQVHX9AV1TbKYiLw0OFuMAAAlPaxzB71AXE
         7l13+mxtBE4i5yQFDOd5oNEwJqBlxRKK2gxLIIZh8/Al9Gn6CJMpDxRWTUDmkEWEgh6Y
         4M/A==
X-Forwarded-Encrypted: i=1; AFNElJ9Tzs6zVoet2plBIsdHxAs8tc8QfUbj4FCfUmNR5YGtRb8vKBb0xRSthkNerbjk8CqtsJ3oI+U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxcna1mstDh0PdG4dCRXtqwvKmUY9ZR2NtKJgi2ebSCrvaXkapp
	dNHBd6H9pn6niFcM2vfqmvTj6ItiXSwoeVZIOxqjwx9KEOnIvmlL9gOc
X-Gm-Gg: Acq92OHJX6v9P0VGmtfnc3/ErjxSkSwiUTGHSvxHI+xqwQvaGUBr5vhyipMuqmOLpUp
	NLYV9gjLKr60F3EZj8O2N8hbcnPWvl57FD3ZpdZhuX6T2WT3Ne2zmAHYClyKWeQYWNn9zJQyVwv
	YlJcBu1nYq6nl8NFJyLKuX9c0j03Z3xw7y+qtedrtDkcFEbtH0OZQoD1UNcV0DzcDIOtbn7RYwi
	lr5i9zbQlIz7OETbb5WWCZRg/pYeJCW3nvogWbGJFQZ/DW7tx2t6F4TW2muMOMge19LsSdIwIuz
	LD9rh9haiPRyoEE2ADitKgU8NoIbx3aSnOpXscGw8PwNG2xsctGui2bWgW7LrdKZA+wY99oOlLS
	I1XJZ1/saeOV8jih+EzF6lwQANBn4gBattzqGFeLluLI7+jTsbBkt5hx7yAAByGnUDhYkeDNPqD
	vy8P0A4DZKo+yYrG52s8XVMxf0ZUcVTSH3chnAYNEC82vTHZLDke7ut24J/hYxZIo6NFg=
X-Received: by 2002:a05:620a:800f:b0:915:40ff:4e10 with SMTP id af79cd13be357-91540ff552dmr582669085a.4.1780162530542;
        Sat, 30 May 2026 10:35:30 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153244e114sm565606885a.5.2026.05.30.10.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 10:35:30 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	daniel.lezcano@linaro.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	dlan@kernel.org,
	chao.wei@sophgo.com,
	anup@brainfault.org
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	hanguidong02@gmail.com,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v5 RESEND 2/5] arm64: dts: sophgo: add initial Milk-V Duo S board support
Date: Sat, 30 May 2026 13:33:44 -0400
Message-ID: <20260530173347.33533-3-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530173347.33533-1-josh.milas@gmail.com>
References: <20260530173347.33533-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds initial arm64 support for the Milk-V Duo S board
[1] making it possible to boot Linux to the command line.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/arm64/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
 2 files changed, 86 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts

diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
index 94f52cd7d994b..68aace728223a 100644
--- a/arch/arm64/boot/dts/sophgo/Makefile
+++ b/arch/arm64/boot/dts/sophgo/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
new file mode 100644
index 0000000000000..8632470f43ab0
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V Duo S";
+	compatible = "milkv,duo-s", "sophgo,sg2000";
+
+	aliases {
+		i2c4 = &i2c4;
+		mmc0 = &sdhci0;
+		serial0 = &uart0;
+		spi3 = &spi3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&dmac {
+	status = "okay";
+};
+
+&emmc {
+	bus-width = <4>;
+	no-1-8-v;
+	cap-mmc-hw-reset;
+	no-sd;
+	no-sdio;
+	non-removable;
+	status = "okay";
+};
+
+&gmac0 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
+
+&saradc {
+	status = "okay";
+};
+
+&sdhci0 {
+	bus-width = <4>;
+	no-1-8-v;
+	disable-wp;
+	status = "okay";
+};
+
+&sdhci1 {
+	bus-width = <4>;
+	cap-sdio-irq;
+	no-mmc;
+	no-sd;
+	non-removable;
+	status = "okay";
+};
+
+&spi3 {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&usb {
+	dr_mode = "host";
+	status = "okay";
+};
+
-- 
2.53.0

