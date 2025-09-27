Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA937226D18
	for <sophgo@lists.linux.dev>; Sat, 27 Sep 2025 17:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758994614; cv=none; b=HmEnKpdijiddbNWebWdy/p0SZvzH7cBkRM5c+LZrxeMrz+1gTEcAQNduvM9hYvhw4FkRkaQOmSqB6idTlO2RDYCNkAEwnAqhoIa8UpCSOF+qjEMRXKqRyGt19coovaOexkP2xBbqqbq396EhvdJAe3GoFWPnPDYT33L8pBmAE4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758994614; c=relaxed/simple;
	bh=CacCShdL9mIdGIFJ5hrEvk59oQfMFmDV4ddw92BN+ZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lm3MTxnLGn8PB4JihjpNPMcXVZ7pBrOUdQoxaPuIM5WolwsmM9kVOycg+fn9ExSr5EEH5IkXmnciQQAGaz1utlXrM87my1HUHTkWY9hE38be0vI551Z5rmocSKp2s3uARSHgBFybbZW+sshRMiaBpNDZMTlMquf35j9GeOu738o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iGG2g7/5; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iGG2g7/5"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-749399349ddso39500137b3.3
        for <sophgo@lists.linux.dev>; Sat, 27 Sep 2025 10:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758994612; x=1759599412; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7aFCqQ3/V6ru1hFk7bAyx9VSAviREMqp+MZbs39lgdo=;
        b=iGG2g7/55G44ow6mwSuuJOt5Bwr/VAZMV1rBHcx0+D7MnoKyrJ0jLumTjbHcvbAPqq
         g2KEjqvBgOovsdIjQa8f4papxePZol+RXxWfgj40VVPG4BH7GEBYVv0N24yUE4tBDGxm
         ltJjmQ0/pDKZn7jO4DSEQSjWmfs23BNqN8FVpA00btavhr95q/va/AJm68p2HNM95nik
         UKjlmjMMtytwZCQxQWukt9qsu6nhn4ZnFRBpFAvES1lw0yNVXATV5+HIcgnSaFsC503w
         de9FDu0NXMqa6zOoKfnZXQn1FxJavMNtN9Rka/YNPP96XMGrt5yFepfoudk/BdH1TP6J
         lbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758994612; x=1759599412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7aFCqQ3/V6ru1hFk7bAyx9VSAviREMqp+MZbs39lgdo=;
        b=OfbZCBrjYs+84DAsQJ+7izFTxqR7yDfaSpm94QXFP2IHEdHB+oZje7Mew9aRf/pjdA
         fvKqu9VIs0I2ZOgpRUjC+aAxTtk3DRDtcshk5HNfu/W4qTfd96WyzDuX7IMUQzzhEUq/
         GyjwrGfTyy0pQXXQTGNiPYq5pJcwmFT6fkGJpd3LfP/HnwGhlWyBRYCBqy9A0ze63aV6
         jQyW1C7SAe0cA7MLRkhLH4jEUTgGbtSlHa8bk/iK61EOGWY+3aVAChwNPE0TdJSj4iPl
         4AoLehLfwj1UZxVkCBXKMKp4xDV02IiBsNcIrrbF0UXLagrM8keE1KgyF5l5VYzn/sjI
         N2PA==
X-Forwarded-Encrypted: i=1; AJvYcCV+OBkIaHaNXuAcXXpwprOZV6/UnMrtE+sMg5ujm7IRCxyqdhPffgPEBFgkjCz4udTbGa9NEZ8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEE1GSoMhXEv+iH9qG9C+y9xu2kW8IH42M/zSIL8xibh1Zap8Q
	AuiwLjl3B7IO/5pnfLIk4wx2Ud2KNVu1P/6ZeRM+McoaUqAIaZ3dvHnf
X-Gm-Gg: ASbGnctlQr3KZ/P3zgI3dy7r0o6Tr7feDP5qlqV9+MmM88UngBocRpdwl2GzydrLA84
	xji1EJAPdwSqCblP4amE7wvZfYNrQbH0TUw0Hx09W1dAdNZG1jrCZo8jlEV4s4MUhgG0+cbxelU
	LTOm+yfHEgeCe4H5ge06PgICuJpsehx31AaWXcygSjzdQQt7meKghQIIHRhRhgBq3CFOCKRJ2CB
	RDtqDGNVo/JFfdPka7IthgBzXnME6/uA2JTOpWDCwy5m09kCZKe+wXnBTkJenS6Rsc5MbxGpqko
	1xEg48MiaCysHilimTrByixfWqEqCDs1lMmbjDbQZ4L/LnVPk9RZrzIRyg8OzC/9Fe+9mOesCu6
	a
X-Google-Smtp-Source: AGHT+IFgh2OqcZz1Eld26CBJym816VWjlRqeI6c8UTa/AtQboOoHsDP71YPGlDyko8Ybrd19IS1g0Q==
X-Received: by 2002:a05:690c:23c6:b0:74e:5942:6369 with SMTP id 00721157ae682-76405aa470amr117765847b3.50.1758994611615;
        Sat, 27 Sep 2025 10:36:51 -0700 (PDT)
Received: from sleek ([2600:6c65:7f7f:fe0b::ec0])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-636d5b1d83csm1269716d50.11.2025.09.27.10.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 10:36:51 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com,
	chao.wei@sophgo.com
Cc: josh.milas@gmail.com,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev
Subject: [PATCH 2/2] arm64: dts: sophgo: add initial Milk-V Duo S board support
Date: Sat, 27 Sep 2025 13:36:19 -0400
Message-ID: <20250927173619.89768-3-josh.milas@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250927173619.89768-1-josh.milas@gmail.com>
References: <20250927173619.89768-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds initial arm64 support for the Milk-V Duo S board
(https://milkv.io/duo-s), enabling the serial port and sdhci0,
making it possible to boot Linux to the command line.

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/arm64/boot/dts/sophgo/Makefile           |  1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 88 +++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts

diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
index 94f52cd7d994..68aace728223 100644
--- a/arch/arm64/boot/dts/sophgo/Makefile
+++ b/arch/arm64/boot/dts/sophgo/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
new file mode 100644
index 000000000000..94cf89d423de
--- /dev/null
+++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V DuoS";
+	compatible = "milkv,duo-s", "sophgo,sg2000";
+
+	aliases {
+		serial0 = &uart0;
+		mmc0 = &sdhci0;
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
+&pinctrl {
+	sdhci0_cfg: sdhci0-cfg {
+		sdhci0-cd-pins {
+			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-clk-pins {
+			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <16100>;
+			power-source = <3300>;
+		};
+
+		sdhci0-cmd-pins {
+			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-data-pins {
+			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
+				 <PINMUX(PIN_SD0_D1, 0)>,
+				 <PINMUX(PIN_SD0_D2, 0)>,
+				 <PINMUX(PIN_SD0_D3, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+
+	uart0_cfg: uart0-cfg {
+		uart0-pins {
+			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+				 <PINMUX(PIN_UART0_RX, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+	/delete-property/ resets;
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
+
-- 
2.51.0

