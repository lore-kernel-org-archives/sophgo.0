Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E4F23E25B
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 08:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749630374; cv=none; b=Z+2ObT0L1bRri5xM5G86xlKc7+2hyf19flMmy/7xV92om/PBkz1jpu/fBzhB21XEgMVt805rAbDtllSI0ZNimxwxZoh2wB3ID1CRI5Q8vyL7cxpsYaSvKCnOibfwkFFOr0BkYwCbPC8polCielg7ZgAITGKzpRoGvVWGOvVZUoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749630374; c=relaxed/simple;
	bh=QPbfhA2N9SqnbLhMOGWmza/oK+Yt7c/L2c7nhZXdhiI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q2L1kivTlKI2P5M7YejMwVohiLV3uRt6Gzb7KS5xJxyb2zll5cJ70QN6GxZ8YMalrPEZXqzEPi4b7T0ABy6zv1bLKlQIS82If/4qdCDtgKvmsiqU/ImJaGa+RlSnsSkAWdZrBZbJp8ScdtnXb5/qHDowpwmOvdw2oVIaSsZLpKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N2jfJmnt; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2jfJmnt"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6fadd3ad18eso63436926d6.2
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 01:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749630372; x=1750235172; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sxXUK96pkvyneP6wC9DeR8WotecX7CKM0gM4QRH/hc=;
        b=N2jfJmnt6xXwAncqExOx9IcF66K4pI0NzVGiOpW7hzmbm5vv93pqJ/M7rv9ELEas7N
         aUHIQ7q4gI5DnA4z8tvx/tJHKQ4b16tRVIVONnpdFm43V37+7VLfuY1yfO8jr1dOVFue
         ugw6nIXeEVuSxWrR+nLl9V7XjPC/iAF0VnBLI9LKQO/FuPkqY07JZeTkuo16DwrbA8nW
         unDALW8TEotS6FzBnLorF4Xd0sDnIFpeaaFEE0c1vvDX5mQmOpiSe9D/KqQND1hxc1Vr
         ZKUs1lCdaJIxfQf/s7XtVg2J1tU4c5YqgZQD+JhCtlvGCt5MU8n9bQM87mduajR3mjWU
         e5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749630372; x=1750235172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9sxXUK96pkvyneP6wC9DeR8WotecX7CKM0gM4QRH/hc=;
        b=vRsxdlnHotWvMm4qYkeGUxwcGzXwBZSeWrPThaSAPuDpM5Ge2J4DnS1p5FfXcSZu5n
         +/MX45zBWzQhn10/NG7CIS5fWWrPp0rdQB12VdMIRviquTM+VmbGeOK78InSgTZJeCQc
         /Cd39tLw/qnoZU/JBH8E9sGJSO4Iw2bfJTAC6n7AP3dvHgYbxGXZb6IiQs72xmHxnzo6
         vNSHw42OjIKbXlXhCOtmN9iKh4ci+ZZhHnYVE7E7SSz06zGndX/sT7t/YDz8iz53WsCr
         wtqrWgytDVLPzG4JTqdyyEQvqSZ7WqP6LxwjTzQB4SWNHMBF+vLb7HBQswfOsTClNb3S
         kCKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXauWxWyC425NYfxq9RQ8dEqBlP86mZyJE2SRvzzhzwIhlEEZFF6J1+OJKtYR0I6s3dvUcED1E=@lists.linux.dev
X-Gm-Message-State: AOJu0YyJXb2tY5l+sd2vPx3/i4ecAqrHLdMz1Qu8+tuOQBLlDtiB/kTt
	FqO/6wgX+ZKFhiPDvMKlqa7L/Rx3lp28UvkBIV2HZnhEEhHbcvsGEaaL
X-Gm-Gg: ASbGnctqb1gfk8K6+Lo05soliS92riQPoIIFYn0UyNYb8XJqFc9zEL0MZxOJTTrLGRp
	DsjnAnYWS99nB4Ck6h4k32gWmEWmIWKceqwCC6yt1oJCfvHZf3gVs3jsNIn5a81HXUUpgndkGK7
	iM+hw1apqCm+IH9KZ258NI2P36z/iKHsNDRWhyhsx92QtsOxEQ5amzIEtbng4xe7xxd2t5Vnh0q
	hj9R9XBbKzwfFm+HxzF+3uOYJnvgJ7yLQN0X0Hqbtvbwu6+QtAPfUv+MEdYhZ7taaLcr/VgZx2j
	DzxF/UT1uATaUE9tyKzYJKW/b/pOUl2nUCsgSDZTI0WRB+oa
X-Google-Smtp-Source: AGHT+IHitneo6m07KgIYEwdAH+xtCGs1vUPSxrM/i2Z8Pe/8lvVYhsuxoJ4yasaZr1lrb7/koSfGuw==
X-Received: by 2002:a05:6214:da5:b0:6ed:df6:cdcd with SMTP id 6a1803df08f44-6fb2c36a381mr41319726d6.21.1749630372047;
        Wed, 11 Jun 2025 01:26:12 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b3648dsm78896886d6.107.2025.06.11.01.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:26:11 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH RFC 3/3] riscv: dts: sophgo: Add USB support for cv18xx
Date: Wed, 11 Jun 2025 16:24:51 +0800
Message-ID: <20250611082452.1218817-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611082452.1218817-1-inochiama@gmail.com>
References: <20250611082452.1218817-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add USB controller node for cv18xx and enable it for Huashan Pi.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi            | 14 ++++++++++++++
 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts |  4 ++++
 2 files changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 65eceaa5d2f8..3ea3a1af103f 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -428,5 +428,19 @@ dmac: dma-controller@4330000 {
 			snps,data-width = <2>;
 			status = "disabled";
 		};
+
+		usb: usb@4340000 {
+			compatible = "sophgo,cv1800-usb";
+			reg = <0x04340000 0x10000>;
+			clocks = <&clk CLK_AXI4_USB>, <&clk CLK_APB_USB>;
+			clock-names = "otg", "utmi";
+			g-np-tx-fifo-size = <32>;
+			g-rx-fifo-size = <536>;
+			g-tx-fifo-size = <768 512 512 384 128 128>;
+			interrupts = <SOC_PERIPHERAL_IRQ(14) IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&usbphy>;
+			phy-names = "usb2-phy";
+			status = "disabled";
+		};
 	};
 };
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
index c7181ad99f32..f5a800f488fc 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
@@ -88,3 +88,7 @@ &sdhci1 {
 &uart0 {
 	status = "okay";
 };
+
+&usb {
+	status = "okay";
+};
-- 
2.49.0

