Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717894BA1F3
	for <sophgo@lists.linux.dev>; Wed, 14 Oct 2026 07:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963971; cv=none; b=gmtioKvcKehoF4loClufCppbxE8rXzIZ9fqAmw8gY0qjS1wzkzMXeKSpU3RsKdMKJsYL1+SYAXqaU5GtWKzShimlzZo/q2jEHzcazex//3UZsNkepdcx3j7azkwQGc13wf90DVuOnxrTxY4pabl8j6emG7DHzAbHhwihS7oekqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963971; c=relaxed/simple;
	bh=CfdhSE3liIR+0R6sqyadTRehF8WcFvwZ62bfQk1lc2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cDZAlRAeNDWNCOZ0wdes9fD/cmft+QaWcrbcxT3vl33RLMiIP+IvAdFe7g2KdXpMtUTtrlVRMO79CySzfYdpG1mvQmDSVixLshc06UwIRZh1aaOxqiJVk2N72ZEjv7Mjab0/BhtrBU+SVda3z/a/uHEvuCsA77p4O5eCoyZP6Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=slZcMn7o; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="slZcMn7o"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd3310348d2so2707190a12.1
        for <sophgo@lists.linux.dev>; Wed, 14 Oct 2026 00:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791963967; x=1792568767; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1MGyxds2cOQE9gU+h+bijFEd7tAx/jconp/HVBGACCc=;
        b=slZcMn7o1IbG4tVmKhIy5s8cs5VmuvRU2IF4w8rSrkqV0j7sgAV3B8Z1jEj7jyF16I
         j2oim6WS0PaDLnP9dfQ8s3cZZdmkIc8MPr3+832A+4zKNSxXhRSLiBl4E8OEtL15JkVg
         9izgCMyhQFHOT6zuk1vLHYdFDvGZ7Z8SciTKI0H63ufIg2ypsY+PWIJGqxdLBQ5naMJl
         otfE4hrir7cD2vtTaRTDBjizdG02JCj+xfpdMyYPpOuv09qy/MDjQB3/PzRpW7mQZrsf
         VR7EY8LxXCfER3c8DL+1OTfNkYly8V8gYzNKKep8i3ykmxemLN0ReknCFFcvmEx1yKv5
         daQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963967; x=1792568767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1MGyxds2cOQE9gU+h+bijFEd7tAx/jconp/HVBGACCc=;
        b=yqzkbjkg2/P+Z4trtebv9GUiEpIsd+EhC/Oi56gODQ83VmMxuGhopBfKyAPq1Sk7+O
         pht9yS/41c9QPe9QX2HfsDlS80ghn9cV/+eV0c18yfOka5TZhBxjXlROsMmu0tvBHaIu
         o6xa8n5LryjRQoj+EgGMMAvglkZIb1a7i8lufFWhzObjwt8uBsjzdTqNyBEIPq8rZeSo
         5LuteXwqP4s7R2HcQTM20xDrJrP+be0cQ0kHGE8CvJY82JWgO2oNJJbqYcRvjUadCtSH
         2SjvPKEMgxXVI3D2z6TFbf0RylRuw/h+dEmmC2QJoYnP5NMfCCWCnUNjZcUvjKhOy6N5
         vAlA==
X-Forwarded-Encrypted: i=1; AKwUvBytHKfh7r05hIfcGtTzPH1f3dpnxtfoatprftpttT+xXQCnlUZ+bwnZQheff1DPI3eu+cp1eb0=@lists.linux.dev
X-Gm-Message-State: AFq9FYIfjWhhcPNa/2WzBK5FFht+mYf+ZrSBRRRbVK4cBQzYIzAXhuoh
	xmRusqwP5FdTUQlEwsmxiCNmYRku2dZjHLMNBcQxqaA9JlOXmx3pWKQx
X-Gm-Gg: AYBFou002QyayVHYQI6PX2fzEo/vgtZQAIhdzeEFIjOU+1hSz3jfZ0bbZC8yuGH9zXm
	Z7sfkaJLcGem1qNczZ2B3ZsaEIhjLJMsfJ611GQK/DvYlPuH8eBI938NRw+v4TwPaIdnA5uS8A5
	gvuJ50lfBYkeAQrWvyCR3XLCGe17vW3whzFB3+ZMd5iScg9zQqW0Q1lf6D6zWtef5wHsRthpyJa
	UpZCQtg67z6MBXsKCEFTBgVgoJ4xRFPDs+NvzupGyCZshVs+O5rios9k8GetzTxjEA4Sry+DYOi
	oNYfo7xqqGojHyQmDaCp/pFr9mQiYPfgPp3lrdknwr0GMNy+5orqR5wz3ufGbaKMi4WDVT0W9Xq
	DAAKSfKANpaWUOkDYoty4JEGTXX0fIA7VHAri6f7lqAD7iKRYa6Gz26t4p/4+qlKLdN8k/NuwDV
	q7cI5VlRdA688kZ4fhHcfodEXsP3lxsYnv0qbuwPEPoD+vciv0Oti6xzUPUhVO7JIJiQr6
X-Received: by 2002:a17:90b:4008:b0:3ab:3767:65d1 with SMTP id 98e67ed59e1d1-3ab3767b8ffmr7741852a91.22.1791963967512;
        Wed, 14 Oct 2026 00:46:07 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f1fb257sm3293530a91.0.2026.10.14.00.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:46:06 -0700 (PDT)
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
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 3/3] riscv: dts: sophgo: sg2044: Add eFUSE device
Date: Wed, 14 Oct 2026 15:45:15 +0800
Message-ID: <20261014074516.240247-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014074516.240247-1-inochiama@gmail.com>
References: <20261014074516.240247-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add eFUSE controller node for SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  4 ++++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi               | 12 ++++++++++++
 drivers/nvmem/sophgo-efuse.c                         |  1 +
 3 files changed, 17 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index fed3d9a384a0..1b506972d465 100644
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
diff --git a/drivers/nvmem/sophgo-efuse.c b/drivers/nvmem/sophgo-efuse.c
index 5f90adaf8e4f..568d17b88ff6 100644
--- a/drivers/nvmem/sophgo-efuse.c
+++ b/drivers/nvmem/sophgo-efuse.c
@@ -14,6 +14,7 @@
 #include <linux/mutex.h>
 #include <linux/nvmem-provider.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #define SG2044_EFUSE_CONTENT_SIZE		0x400
 
-- 
2.56.0

