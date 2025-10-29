Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9AC1E3762
	for <sophgo@lists.linux.dev>; Wed, 29 Oct 2025 00:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761696713; cv=none; b=ejrvGgaaB0RC/pQdoJC+6y/xnMsCdnnoXyaLocn+WpKGSzyGkdosvINv/kYOb3Cik1uFKi6gsSXSIk2kTMjveheEi3I4PgI5aqFG0kd8s9GVou1j1hP1LGRRhuZBoXVCHtMA5nnBvbDqzR2F7tcbcV4nClClTy2axDCOsaaMEko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761696713; c=relaxed/simple;
	bh=zldgFnw0AZINZXAWWKci4rcuZmofOiJT+xwC3f1wbqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HHYoSQvHxRatxwXJYzytBUqc9/wOBvbBZYc2C7IJDs+3e3aUmBXSFQwd6MrOUH3F01AsJBtKH6qfG87Jgk9IRpCTImLcRzqf7bb9rF0eVbLobbvg/Cnektl6+6RDUEhnOS/TnahZIENq5lqRHS1Ypp5pbt+4UnXJn8g64SAToSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0HOMVAb; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0HOMVAb"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-87c1f61ba98so94224266d6.0
        for <sophgo@lists.linux.dev>; Tue, 28 Oct 2025 17:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761696710; x=1762301510; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVnVAo31Qk9BfTF6wZceGmP4C2BUIBcQwu7HUQHA8Lo=;
        b=h0HOMVAbk/+9wZbBP/uSzwhkRBylm+pzZih9YPaXEnJYt1SmYKGnjBCpPpdZJl8axi
         ETRFvUTfITinN/7xqJnqWzCIAX8ZobdUoeAwsUh9YRk+rcRoTLla85f1BQLwRUI9JnTJ
         UTXovV9hAG8DisHT8iHAUZ2CEO7CuABLn2OEom7ldMeVcBY/782HlgtJdFpDDAWEckVC
         HgU5zkZy9v7TdKGG/IqUzpil+g+SaFiYqMbjbLFsRMESaqReF1AZx6ilkw+AYQKJC6e3
         tTC2pRhUiy/yc8uOespre0oExLr3Wqx5KogyPT85JKJUZoCKIDqRJxe8gNjzVZSUr4UI
         0uLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761696710; x=1762301510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVnVAo31Qk9BfTF6wZceGmP4C2BUIBcQwu7HUQHA8Lo=;
        b=B9XBXnLhGzYdIoZcNTXiT2KcY0vW2zSlaIuT/XfN+EMUBEIZRSUSFDZ26MhK8cwk3E
         oILnrThcgwSwkVSj7lviWF6nDsMIFu16Uj0mME+6EIjM75BnRvlVy3oCMh/z91LgRPCd
         ts7IMKjFzykqZBY9PoKyUlbLAFxA3rZoHmuVTr1wzIHRmyFpomUueS2w3eq632vPz0vb
         0O67i6e/kFU41GdtSFuYPNC9fOWUPHJYZV2zgjQ/Z2TfP9dNXarFQtSGPliXyf3Uj3L2
         Jct2Az1KymXXkleYKUYs49JePf7niQ8+7XNtn67DdbbuNMdVCp6NMoeypBm+2d6iYI9Z
         f+Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWEk4/GqlLAy3Z1ByZsirU5YfGCmM25VlvQ6cX8EJDzzgC5U608ZwdBpQHbZhNGKcnnX/fI0dM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPu+7mJkPC8EsAr1p3iol4551S+abFEjo5hZXbwKH7XEtZs/TS
	sYiONjjc8rXftrfIxBlpUFqzMlJjRh+0khDALKsCuGLs9KhoT48MG9U8
X-Gm-Gg: ASbGncvdD/nxdv2mV9jVaoEIX+/rV8PZenoR1jD29p+7QLVimY+iE/QPO2dLJmU6aCD
	vATYFBPo569F4w5ByAAyQuRs2ckv4OltPOH+8j4OcnfHkAaLQQDhivzaChtOIUxGwRuHLEaYtX9
	nkCoI8CjjA0l8vAT1M4OA1yEzmYhix5sqQhtbE1MtdvxJ9253tHIk1MN9QQeQZYhwjvI+Y8xxSR
	VqwSh45sWB7FTcb2FFkU77DLHXNeduxF0X/DDEz8ZjSrHth4KjY2OZJ8Kc6xwFOX60eGeI1bQz8
	S7kbV5a90tR9HeWqoWZe7KCRof4xMeCUG2sAmBoKGFxzeQAnPg2gw6e7hhpfmPEOT+z3tLxibEr
	zH2aUIy2Qqw/H0P4uS/lNmXnIg2eWLCcSgalO96CfAC5pUvIz74/fWFojO4tNb77Ui9SmljdtrU
	hNLB9jWLe7ihdLFy4HaRc8GXBU/py3VVHRmw==
X-Google-Smtp-Source: AGHT+IGIc6sh+oNl05iSSCfx3miJfIAzo70BjFfgaGOYdbW/vkSvtUIPlil1z/1rfFLSdusZMiyOhw==
X-Received: by 2002:a05:6214:1d01:b0:87c:16e7:892e with SMTP id 6a1803df08f44-88009c2f115mr14442296d6.62.1761696710612;
        Tue, 28 Oct 2025 17:11:50 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc48dee2esm87255906d6.23.2025.10.28.17.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 17:11:50 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com,
	chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com
Cc: josh.milas@gmail.com,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 5/5] riscv64: dts: sophgo: add initial Milk-V Duo S board support
Date: Tue, 28 Oct 2025 20:10:52 -0400
Message-ID: <20251029001052.36774-6-josh.milas@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251029001052.36774-1-josh.milas@gmail.com>
References: <20251029001052.36774-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds initial riscv support for the Milk-V Duo S board
[1] making it possible to boot Linux to the command line.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 80 +++++++++++++++++++
 2 files changed, 81 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 6f65526d4193b..58cc6b70d8de4 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
new file mode 100644
index 0000000000000..174c194e1301d
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
@@ -0,0 +1,80 @@
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
-- 
2.51.1

