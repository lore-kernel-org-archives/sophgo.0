Received: from mail2.viabit.com (mail2.viabit.com [65.246.80.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2018330D29
	for <sophgo@lists.linux.dev>; Mon,  5 Jan 2026 12:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.246.80.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767614511; cv=none; b=XArDRntZ3VQetZiMZYU5W5e+nfpzE6A2thM3rIhjI1scWNq5CmLnJ8WvxqKYYjwyf8mVgi2X16ujJ4FixfuUDMb/0XJA4TvpG7oozmHQfEy1yeQ8pHPhyrIUjS6T1OcGP7tQU9TMRvzbjbMggKEkj7xO5zP8sW33z3oqfx5x1zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767614511; c=relaxed/simple;
	bh=wOznH8tcG4pWKmi1lvz/2d6jYX4HB03leXAPBFA1+qI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nd91YwyY4fKWEy5zPdoqJGSLyIrC+bUVDNnUlZzbPT3fVQtAzPtUP21pRe9mEplbTOCsafODcR3YmdgWs2PLu0GX5B7vsXDnanZjmR1i7Lrl7oqfrzvbzs9eFUA84wsA6asL48ZbBzTLb2nBU0hyYMJshpOH2GChTn0UEI0z8pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orlitzky.com; spf=pass smtp.mailfrom=orlitzky.com; dkim=pass (1024-bit key) header.d=orlitzky.com header.i=@orlitzky.com header.b=PCwvHKav; arc=none smtp.client-ip=65.246.80.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orlitzky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orlitzky.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=orlitzky.com header.i=@orlitzky.com header.b="PCwvHKav"
Received: from mertle.michael.orlitzky.com (vpn1.metro-data.com [65.213.236.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.viabit.com (Postfix) with ESMTPSA id 4dlCZV2JbDz3wpJ;
	Mon, 05 Jan 2026 07:01:38 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=orlitzky.com; s=mail2;
	t=1767614500; bh=wOznH8tcG4pWKmi1lvz/2d6jYX4HB03leXAPBFA1+qI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PCwvHKav9UcLxTfVP+tMg2OxUMKawmog2KuOEsEuWMyfqcEjD9yneSC/3LRz58+HA
	 rh85cmWcpcfBiMBFI6wKdtuUNj2iSiGFO/sDBx4XUY2bulZbh+jFsg5UsFuuN+R06f
	 MO+XR6HsXPPLxST842C4gBi2wGjjKRIV+Wo54tzg=
From: Michael Orlitzky <michael@orlitzky.com>
To: unicorn_wang@outlook.com,
	inochiama@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/1] riscv: dts: sophgo: enable hardware clock (RTC) on the Milk-V Pioneer
Date: Mon,  5 Jan 2026 07:01:29 -0500
Message-ID: <20260105120129.58895-2-michael@orlitzky.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105120129.58895-1-michael@orlitzky.com>
References: <20260105120129.58895-1-michael@orlitzky.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These boards have a working hardware clock if you put a CR-1220
battery in them. Let's enable it:

1. Enable the (already defined) i2c0 by overriding the default
   status = "disabled" with "okay".

2. Define the rtc on &i2c0. This is more or less the example from the
   documentation (devicetree/bindings/rtc/rtc-ds1307.yaml), and it was
   present in the same form in an earlier 6.1.x vendor kernel.

3. Copy the pinctrl stuff from &i2c1 and update the PINMUX constants
   with the IIC0 values from dt-bindings/pinctrl/pinctrl-sg2042.h.

Afterwards, the new I2C and RTC can be enabled with,

  * CONFIG_I2C_DESIGNWARE_CORE=y
  * CONFIG_I2C_DESIGNWARE_PLATFORM=y
  * CONFIG_RTC_DRV_DS1307=y

The new I2C should appear under /sys/devices/platform/soc, and with
any luck you'll have a clock the next time you boot:

  [  T367] rtc-ds1307 5-0068: registered as rtc0
  [  T367] rtc-ds1307 5-0068: setting system clock to ...

Signed-off-by: Michael Orlitzky <michael@orlitzky.com>
---
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index 54d8386bf9c0..ecf8c1e29079 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -52,6 +52,17 @@ &emmc {
 	status = "okay";
 };
 
+&i2c0 {
+	pinctrl-0 = <&i2c0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	rtc: rtc@68 {
+		compatible = "dallas,ds1307";
+		reg = <0x68>;
+	};
+};
+
 &i2c1 {
 	pinctrl-0 = <&i2c1_cfg>;
 	pinctrl-names = "default";
@@ -89,6 +100,16 @@ sdhci-emmc-rst-pwr-pins {
 		};
 	};
 
+	i2c0_cfg: i2c0-cfg {
+		i2c0-pins {
+			pinmux = <PINMUX(PIN_IIC0_SDA, 0)>,
+				 <PINMUX(PIN_IIC0_SCL, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <26800>;
+			input-schmitt-enable;
+		};
+	};
+
 	i2c1_cfg: i2c1-cfg {
 		i2c1-pins {
 			pinmux = <PINMUX(PIN_IIC1_SDA, 0)>,
-- 
2.52.0

