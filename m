Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795505382;
	b=ctVQkEtAPZg2efUmb9e745qNRyQ2Kbv7L5aStpoQ+Gcpczwycd6nSfoI40++KN79AbjR
	 emWB7rChGAkypU/Y0HLnDaA5bF99+aGLzirPgO9OLV7s8pfrk3twmYRhPTB0AKeRUGeTV
	 tvpB33AphLDCa2mzesyMY+zzSohS/MjKf71c+QcPR9pmYlQUE73Z6KpIMt3CcYfo3iA1M
	 0cmOrX3BwNg9ZfnwYPUB/m4zmJKeaZWkNnUYbd5LgUewbwgmd8o/TgEHJCjIuyGoNXjkD
	 j6yAMJSi+3Mo4+ZHoXRdUG0Y3rebSJxKqJzJjDzUi6w30l5V76nkWhM6yb1PaXF7e4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795505382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JGeRZHEsszBCgxvyCdNDeob7nkbYjLxhNWjrFkp+2Dk=;
	b=Jkiyy6FgyiwbOKu45nt7JLLw0+wDE2xwDthYs0iel2Ac8X/2CQX3T6bhWZWSvkrGscAj
	 l0VwyFKy8xcaFeNdZGkDdrxhw6A5oG7JgDYgROGiW4dyjIFd8Hjku2CBoFwFiliXMa4Zy
	 OIoEOKJcs5tziIrU8RrxW18OmackD5OyuMTcbx0ql1zlOawSrZLdM73f96mFlLxmOu0fd
	 g0zyZATXZNImFQgwe4E71p4ANRoFV9tL4HxQj2j+pcNBNj9q1etbDKwFaH5uz1w3LL3Lu
	 jzroBhCtlHyxF7ZHsKWJWajl9JLHY0Vg0UlNgGUi/m+A4u2lS5nExPMtM34YsucX+qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WJIe6fDQ;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A45606A322
	for <sophgo@lists.linux.dev>; Tue, 24 Nov 2026 07:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7A45606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WJIe6fDQ
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so3355944a91.3
        for <sophgo@lists.linux.dev>; Mon, 23 Nov 2026 23:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795505381; x=1796110181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGeRZHEsszBCgxvyCdNDeob7nkbYjLxhNWjrFkp+2Dk=;
        b=WJIe6fDQOd+jNg4PdIKejbWM9ogVG4hJ187AGSGQXNcJKs4T/PCNEJ0BPwVa5As94H
         X4Xw2Hb5x1Cp9Us7QG084wKh2PmP2mYYYBdjm1x8DItrRldMs6bwlEP9tmlP268ANryi
         1pETz1uuvjjkM+5v+2yBH3U0HYRBt/Xec8o/QZ3ouaDHTHPgd7mONVaCjPIs3x6Zuy9V
         SS7Ej3uJY8DoX5v7ReJQm/3PMv5rFoGZM8+73C7U5SQRI5YEAvSlNAv3eZtq6Zs64BVi
         p+oD1iuYYvMzTnbwCEXp6URfGoQBm6oekbCuY00norZEPywglBePceeQZWFSY/RrXC4Q
         uqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795505381; x=1796110181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JGeRZHEsszBCgxvyCdNDeob7nkbYjLxhNWjrFkp+2Dk=;
        b=DQlo7MP0vQncYHNXzqTzjwU5X7PcbLWn9dKzQzA5PTFM1NKDHkgQqzQUYuSJOxkTgE
         IsmySa4dgz2TM3M4e2rd9NSZwrQqDXreFI7PxYF/yNh9aPnrP2C6rdiDOgAEobAur+7R
         XJX9DkPam+fZZllyDa+wR2vvmAwihOJs+e79Yt42Re947aQpzXhkg8ZqsbpQ+hRlLlRY
         6rYJQa1DloSSBsmwrypHwWVYEjYDf0I5GP2vsS6xsMa34BMSWPupf+AKbj7k4CAjzpy8
         cPmWNboPubNSFty3ErGocNHsl1uxSmE1MR7AQOgcPa4+hJsVTpo8ZJYb8n0kI+Wg0mAl
         WcNg==
X-Forwarded-Encrypted: i=1; AL+hErH58Hfk6wTbLviEiVTpfz8R5xMtzi+WX6tlWLbpEdmHbbrioHrfNvSAQyeQPn9Oqp0KURK1BIY=@lists.linux.dev
X-Gm-Message-State: APuU4Z/U9S0hxI+AZHY2tpOyNc1otzUV2tl9Gt8tOgCemQ05rryYZuXD
	5k/NGjB6tDoc7f9VSQkWkPU9kHheha9/Xc3lT/NHwi8Ak+Vj1JkImEs4
X-Gm-Gg: AZFdTZfrlK7Yp8b/EEntt3wpYtDoqC4eNVkJoNIWkX59tmEnwvLoBO3YuSpW8khJnqv
	c520AQVH26nqHZ15Zsqns2ikvlgHG7yzfvbR7o2srLz//snOd3h3QZScYZ2K/fY+fmSVmDpQsWg
	4jBJYcoOWaX2P7dL6b/mvF0T6QWdVn5QKzXkusOAgSz2gd9KTx3eawAKl00Hc5TiT0aKTLiY4ft
	a/pzLlgYkpXLcUOn/7EPoiD/Xul5+/64nYyANWkFtl4VNu0wU/ZqoqKzWAQzOlwNDAZGFETaykf
	+2XYVkyk2oppV64Sq47RW/PI4mrreHvU/5X0rj8zJDkrVC3dTXSynNdaL7Ot74rk/ORILg4afyQ
	D++BE8Sn9MruC6mgnzQeesBQWMiBZSbwV13Bh6oFc9q8aRtwuc910veYdhbdjTSorcfHxBmemvH
	XeYQJZuAe5ZHnleUl5Zxsf5GnIiImF4yOSfDC+5ujD7g5o9ojwyWyKO/IwOHsQwV7VHmb/uWcUT
	T1SmMZotsxUpmEL6oBMaYsSsM6gdjGNswio4zQwdkpue7tPqejwfdJoW+SqYe6cAnU9pLiK1ED7
	4+JQ/zQWdJ60KbtGhiqkwPKbr7E=
X-Received: by 2002:a17:90b:5346:b0:3b3:ab74:74f7 with SMTP id 98e67ed59e1d1-3b41c955bc5mr12961867a91.39.1795505381135;
        Mon, 23 Nov 2026 23:29:41 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b457a58d04sm8262361a91.0.2026.11.23.23.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:29:40 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <gaohan@iscas.ac.cn>,
	Hangfan Li <lihangfan@iscas.ac.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 3/3] riscv: dts: sophgo: sg2044: Add eFUSE device
Date: Tue, 24 Nov 2026 15:29:23 +0800
Message-ID: <20261124072924.556678-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124072924.556678-1-inochiama@gmail.com>
References: <20261124072924.556678-1-inochiama@gmail.com>
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add eFUSE controller node for SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  4 ++++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi               | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index 88ddc8e793f6..2f9fca6bd110 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -36,6 +36,10 @@ &emmc {
 	status = "okay";
 };
 
+&efuse0 {
+	status = "okay";
+};
+
 &gmac0 {
 	phy-handle = <&phy0>;
 	phy-mode = "rgmii-id";
diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index 320c4d1d08e6..9577aae08f7f 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -408,6 +408,18 @@ sd: mmc@703000b000 {
 			status = "disabled";
 		};
 
+		efuse0: efuse@7040000000 {
+			compatible = "sophgo,sg2044-efuse";
+			reg = <0x70 0x40000000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&clk CLK_GATE_EFUSE>,
+				 <&clk CLK_GATE_APB_EFUSE>;
+			clock-names = "core", "apb";
+			resets = <&rst RST_EFUSE0>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@7040005000 {
 			compatible = "sophgo,sg2044-i2c", "snps,designware-i2c";
 			reg = <0x70 0x40005000 0x0 0x1000>;
-- 
2.56.1

