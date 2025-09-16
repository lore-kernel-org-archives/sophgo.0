Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E7831328D
	for <sophgo@lists.linux.dev>; Tue, 16 Sep 2025 13:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758028997; cv=none; b=sE8yyRS5A+hINeO1JDbihNB8mDo3alkPaCn+XQbn8RnoAGdwRFegglxFzdioU1aq0rhH5cEm3OTz9NBpQ2OUgG8gZ5PS0CpTkkAu2PAioWRF+DiO0S19Yxgk4csaeOb25T32lHz2oTYIfmQlegI9B77brW/5ZbUXEyCaU7XVlTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758028997; c=relaxed/simple;
	bh=SHdpc+7cha07M+f6R46l6uT5x3VEV6Ux3f9d/uogxOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CvZz4y00F73KUI7qNMHBnpwR3EDu1HqIAp4R318CoSGIo7XDVkgTPb2ufgEynrK+7l1lSkBRPMkC+YunRP8y6iYyK9VjyfYOli+nTK3oDA0QRgOChnhahkfO+ZwXV03cZwRqD/0QzhQRcxl6hsqkSaELEdLjmbxeZFP1yVBwcKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECzSYexT; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECzSYexT"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-77619f3f41aso3087390b3a.2
        for <sophgo@lists.linux.dev>; Tue, 16 Sep 2025 06:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758028994; x=1758633794; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yzzsgn9kvMTgwJtY45RJ/1wKDH1k7Bp8Dx6C1RuTuEE=;
        b=ECzSYexTl3PQwFs8tS5h6m3Oy/SJhhU9y1T3ByDfnhCSvyDbKDEhfKzxxXK/8ku++s
         qRpN8SAFt9hwv4mPYgo4+fCTLP22SWjywDxkF/V5J5PZRK+AgwdKHa9yy11KaBhVl9bO
         kWsq6bT564/al23GqknJOZGuQUIyDARQJLezrCzN78MDaTGWXTpL0QuBhzXdqzVSuNOn
         s9QHT9v3nqau4xOEabpC3l4ynRTrNC9xqGnAxdIZgzu2cYL39NIDYoMSJ/41+CRBNBSK
         wuzNHaNE9SwCpLoSUKfQVCMI7yUDn+5mEAO42qxOmclptQ037PILnu5k0ivOB6BcpP+9
         Tb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758028994; x=1758633794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzzsgn9kvMTgwJtY45RJ/1wKDH1k7Bp8Dx6C1RuTuEE=;
        b=b6U4P1xHvwhSwNQJfUZENKhkKcXWtAbiTbD3aAe0A5Nr3R5SO7pVsxz27gbPTPPiwa
         /PU12pfYg5ZiCLhdQhbWvG54LhWX/PCOQzDOCN0DHCM7eASqVb6JQDCKNKpB5m316Rn9
         hg9JVVuzldI74WJ1sfG2/fP6EhVizuR1qvuCZS2+kTA4keMq54q9KLP6XqWmSvOHfbDw
         XUzjp++nC4DEA9RykKC9UYnPqMYbNRHKEW+ZW6Ev9Fp6p0ohdNk0RmsKDWQBPdJpQIjl
         G1cG7OvIzSVhULuQXcSv7+Nb4gg09amR8xEYoWc0KrUEFUuzbqPRDMcJsZfIFOvpeTZY
         kEng==
X-Forwarded-Encrypted: i=1; AJvYcCX8jdnZt0jUZjbTpB3f6yeUWM3WFDgdBzCIcIyQ8vlqgLrrcpv9m0PRT/8CY7YglmWiuVIUcZI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ4Ly22+BU7o6Upd1KbYIvJJ6TAZnpYjQXluJ7cbQl+GnVddkc
	bHpZopo3FT4/o9lqRknBE7xmQgMPXTIt5GuIl4GPOZLHSR3lY8ZY+NvU
X-Gm-Gg: ASbGncsnnC5+TrT1TqCMdnHTqYDqiMWtuiZ02ndhZpPaqeo1Dt/pJwoHkLSG7ZOMyYE
	v9HOf2XSGRFxyZXEXVSz4Ze0CR5pMV+l9ry/XmwozY9Pzw7YQeATQ6bKImRCvTp9yGH0e3osidV
	U7O2xyznHnZKXuqEA4+llf15YsHQTF1twWBQEev4g4P6VIIW6mtN4mDNKWVHdVmLMsLR/GzMsWu
	juncUTn7LqP154qa97c/TbbdpiZqY/wweODncNZu7MwLJREsvb4Odqk0YKXJCU6g2iqkTphANoX
	wRRXO17LXtyyn4YSufBrknDPYnJapshEs7GnJe+qWcDUk3/lRcPWL0ahc4P7R2Fn8KjD/NbMQIU
	+5WH5hyrfPZWzmmmVwL7k2a0zDx+maEjq6OcTUbHH
X-Google-Smtp-Source: AGHT+IE5hq85yAnL8KXZBwRly+Am1wE9i4harM8JJoKLoRcHxNlPBFEDqO+gKM8kuuZ21uWb8lnKDQ==
X-Received: by 2002:a05:6a00:1256:b0:76e:885a:c332 with SMTP id d2e1a72fcca58-7761219ffc2mr20627026b3a.32.1758028993976;
        Tue, 16 Sep 2025 06:23:13 -0700 (PDT)
Received: from [127.0.0.1] ([101.76.241.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7761562f25dsm13277310b3a.74.2025.09.16.06.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 06:23:13 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Tue, 16 Sep 2025 21:22:53 +0800
Subject: [PATCH v2 4/4] riscv: dts: sophgo: Enable SPI NOR node for
 SG2042_EVB_V2
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-sfg-spidts-v2-4-b5d9024fe1c8@gmail.com>
References: <20250916-sfg-spidts-v2-0-b5d9024fe1c8@gmail.com>
In-Reply-To: <20250916-sfg-spidts-v2-0-b5d9024fe1c8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <rabenda.cn@gmail.com>, Longbin Li <looong.bin@gmail.com>, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758028972; l=1060;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=SHdpc+7cha07M+f6R46l6uT5x3VEV6Ux3f9d/uogxOc=;
 b=qrayuAe2fZLnjYDzxOLnAw2az6O9llF8jgD6vCjLrtRLt6EDzsqs6MurTj5fqyOKNCoHEPBvE
 Pr3wyrlOZPfBNPeEyGepFgePvGPIMqcszpioEq6XQVSUSDGYOvRr9xR
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Enable SPI NOR node for SG2042_EVB_V2 device tree

According to SG2042_EVB_V2 schematic, SPI-NOR Flash cannot support QSPI
due to hardware design. Thus spi-(tx|rx)-bus-width must be set to 1.

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
index 46980e41b886ce17dacce791fa5f2cef14cfa214..78460b2851a231a3e06b28f9ac6bffd4700e7dab 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
@@ -226,6 +226,18 @@ &sd {
 	status = "okay";
 };
 
+&spifmc1 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <1>;
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_cfg>;
 	pinctrl-names = "default";

-- 
2.51.0

