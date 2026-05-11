Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705AF35E94E
	for <sophgo@lists.linux.dev>; Mon, 11 May 2026 06:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778481529; cv=none; b=H/NVI1GiUgeUmfImPSFVmJ/LGmS0ghzenhAm1T9UR1GuOdpnVWWC/e/6JanqkAg6u6dPdyflxgEMNXNSueE8Sm5D5Inck8g/XQTZ5H42Jf0TJ3kq/5cfIfDunig+z89bzUwHOvuFvzWom7oBGTKXXjpFfnKaxYAO+nQXt5qI5Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778481529; c=relaxed/simple;
	bh=yXB7EIPk6XevVObOY5j0Sj39ejci5f5ONxRs5/PDOYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BztCVdXE3LzAVnXeZJ48hXvimoP7z20WJyZUtYscb3AP5pALZvZxwrc8NST/+sgcJlqGgr+szwFuUMlvATG1YLbKZ9XeaiY6R92uO9u41kEURPnlQRML4cKNzbXIhmTjUSAe7yzk4tWKUAHOsnpyctnDNRx+sfZ0RVWSif60V0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEGQqtDA; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEGQqtDA"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-82fbf5d4dc2so2768883b3a.1
        for <sophgo@lists.linux.dev>; Sun, 10 May 2026 23:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778481528; x=1779086328; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfmcfX7gTqR/wtswsezRGGU6Mv16ceub/2XE21DxlUE=;
        b=QEGQqtDAE1LiEkLebvPG1E3K28LUoTNyK/m+xTZwpYxCr6obYdrAUoncKB8FpHa6WR
         dKV2+15dBGE/dHcd+TB+nbbqyx+aiHXvi2YYihvTxffI/hjUxiD5N45BHhovTIYmNAzy
         75QfnpTclGx6Nrx/+AJJ3kSyJiMMwVUzotgHWUB5fH/x/eEjdKSRWkGRTBTvBUzDsiCa
         IrPbCC67a2+jGt7+we8cRdEXC+MDXxddfVnfSswgi/LMk4MFQ7BlMg5UfYK9/hbM73D0
         pdMjtUXvvnlLD0PWXNt+MYGM5flqo7Oo7On3CNtUbmvp5R1ayrdMcc2osqKa7Iaa1uiZ
         mw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481528; x=1779086328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WfmcfX7gTqR/wtswsezRGGU6Mv16ceub/2XE21DxlUE=;
        b=Tx/vSNo/k1keDtoKl5kMqqU6JOVEDiXMf5LrOkV9LhSHlO1spmMQ9boonjkGNqAwYI
         vOGEMNM7PBi14ibQQdePvU6NzWdyGKtKgqc3bf3/eJpb9B78OSoW+w4Y54swa4mOaApM
         kdmvnLuOVfMeYiHeZjI3R8Ag+2hq639esAQtguPcSLpEWmbnWpdlb9w90PjkpN/+Uqa8
         a8VitV0ajzOb+d0e6+JO4huyB4jlQLfdkjR3XMcqiXK8FbAgo53huU/t9Z2ouDeCiYY7
         6Wvu8xMLAVIqW30Q6cudkI+h2fZwSEXS2/4WvKyFEvZ8viOutIApHTJzfLv7SGOR4fDA
         VGMg==
X-Forwarded-Encrypted: i=1; AFNElJ8QAKj6cto5oyxT8jJziUfgTg1YMyod8MywFsRObyei6vq1/LQ8BKW+62NeX3H4/Tb7BukhnjI=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywnl9VHKBXycB2xMuz6aAu/a+0jY2xDFslsPKFy1bUFD5F2cRoL
	YGuVRaFKePFffDwJ/BvE4DZfSkk5zpx+shqu821zdyms3EiFR7bwkko7
X-Gm-Gg: Acq92OHVxMS4d+yMXOmES+hbcZ5F0B+fQFAW+UndZQLjL22CucADGCavBiQrlJfKpIZ
	yMPP41hlST1PWBSgP0whFbZqi+zcyBSFj2tp76TU+tkGKYoGGlwE4NCE3HfmiDGBbiLpBq6hFJQ
	VYVF6+dPwXdmN1YjCC3rCBCF0nDBVzwe9kaW3JhW1bySW658mgzaqxVvA+H7XwNXVDJ2DERJmyT
	yKeTXvZlSire263/6xhcusN82Frq9xdt7GjUT91+WDLWC+kPzurGzMwhKLqJ9zprh0veb/Udpoy
	ajUe/4IC818sd1QGosg94kZw2+aGiycc5BmlvmCO/JI1jhwUK5gR7vO0Qx0/CiNGBy75u9vp9ou
	heM/m9TludrvJUnk8WHkXzmSgys3/pch2BQKVg7Och+BVTMNK+lB2N0uBhWXig6D3Zaul/zq74R
	L5eHGu8uY4EVMCrUQVTUAhlyk=
X-Received: by 2002:aa7:9a51:0:b0:83d:446c:498f with SMTP id d2e1a72fcca58-83d446c4c89mr8198132b3a.32.1778481527848;
        Sun, 10 May 2026 23:38:47 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f381sm23328475b3a.6.2026.05.10.23.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 23:38:47 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v6 2/2] riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel number for DMA controller
Date: Mon, 11 May 2026 14:38:17 +0800
Message-ID: <20260511063818.463877-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511063818.463877-1-inochiama@gmail.com>
References: <20260511063818.463877-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the DMA controller compatible to the sophgo,cv1800b-axi-dma,
which supports setting DMA channel number in DMA phandle args.

This dts change does not break backward compatibility as a fallback
compatiable string is added.

Fixes: 514951a81a5e ("riscv: dts: sophgo: cv18xx: add DMA controller")
Reported-by: Anton D. Stavinskii <stavinsky@gmail.com>
Closes: https://github.com/sophgo/linux/issues/9
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 06b0ce5a2db7..ecafdee79ac8 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -417,7 +417,7 @@ sdhci1: mmc@4320000 {
 		};
 
 		dmac: dma-controller@4330000 {
-			compatible = "snps,axi-dma-1.01a";
+			compatible = "sophgo,cv1800b-axi-dma", "snps,axi-dma-1.01a";
 			reg = <0x04330000 0x1000>;
 			interrupts = <SOC_PERIPHERAL_IRQ(13) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_SDMA_AXI>, <&clk CLK_SDMA_AXI>;
-- 
2.54.0

