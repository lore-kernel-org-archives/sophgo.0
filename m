Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AB42798F2
	for <sophgo@lists.linux.dev>; Tue,  6 May 2025 09:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746524017; cv=none; b=ECb9uh03TGOjUWtGVTEDQVWdWIQ6FuR/EyrdSxSyibHyLp6v9ps8yiYdqCdjtVs3tOaKr5D9vOez5yoGiwpgahQJFjbL+BaRQlXkv4AIPgM9M2bHdJE6J1UfjSH2ICGcXLTtz9lnf/yHhfQ0gVd1xpWALqAXfeY3KNvX9xrcAMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746524017; c=relaxed/simple;
	bh=h/lliX6NxpYvnSxi2fEeCbKydjYF8K73+XODDlMMvVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fsVLbdwaxkVPh2EtuzRQlgIfr//IyoE/KHn1hwyGVL3hOYwsb2Qk8Cpw2K2cD8/Ff59NcfdGX1w3BZlm8J5FGdgeKyGtJs2CeeQw/sAy3Kl185SXgw+tEsYvDoV1++NzkCj8X35Pww7IHPdBzKSNtstUFDoc8NAAZ5X5ojsq8UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNRPWZsB; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNRPWZsB"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-476af5479feso65011261cf.2
        for <sophgo@lists.linux.dev>; Tue, 06 May 2025 02:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746524015; x=1747128815; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TalyY7f0z8WFpKTCKpbbWsIQgKcxq7l3XWcN5VvgXPM=;
        b=CNRPWZsBtIguBcvQW/j147TwTWSZogFtg1mz9Bf+J0KWBeD5ZOuXeOs8Z+P3qv8aOc
         MvfOoG1xhWg60G1GU8KxZEtT4Ye79Dd1EmRIhkJ+wgEVXeqGhWXG9XLTk21idDPbfosE
         bdG6i4MHpxAAhHeCEoOHkGOeiSjLwhpk6xzfbuNIfNUdIqAC6SddKxd9Yzx+p+Juqqu8
         5ztrtZXCrWqLwWa3czRXYcCN2ePHk3s9RPXf3lUWQGF3H51IdtxQwomRuMCYXhWXpnIS
         WCMAJqZN30Psl/91pqd4z9ZCjRfsYS72EM3YPhcLeMmWHOsxtJWU+V4HhEAI7FF0Swrk
         UOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746524015; x=1747128815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TalyY7f0z8WFpKTCKpbbWsIQgKcxq7l3XWcN5VvgXPM=;
        b=vlYdXbOp83ZIrvnIV55HMdwKR55B2ezqqcf/H1IQoex2nqpa4Dr1WbHS5uN+a3FM/Z
         DkvwPevWYQPeczMUA+z9URp7zbLgAk4n9PW8pcn3ex6bkagzuGtZ8mT2SGbi911RDp1W
         NfRm3tmTM/i9AR1NUkUjC20PVRz29nNaDZzw3bV2I3IKYxwZgCRDqE7NQTLSQxKQtHum
         AkxFfeNYp93cFkSNYILLSHs61lq0S4AbCMAr4RZpxq6D91prosGk26jfv3ZodJ24AnnX
         44Z6q6Xmu//l1gAgBlacfEmB+/lCHfKPShQJPbuXb84a0MuFdljKKH7xklOj0E7dqxle
         AVyA==
X-Forwarded-Encrypted: i=1; AJvYcCV2Y/R5lVRXpXPTExiRwBhL24DbkzUYpvi9gcTSp32c+I473qPssy4qYaZSM2JOKePayf9U9gE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxcicC22+jr4xUP3CwGlKESaouQirzS8rDsOYHlWLup+GML099B
	KXYTUa02AsyXOvYFHgrjz9JkG/X9fQGnfM7m2CALnPJ+0F4R8vAs
X-Gm-Gg: ASbGncsOAI3aSWfcZYxSqXbknL532NOyxCj1B3GhMsAzIp/vFcAr5qv2Q4JH0tPdQSc
	SuvRK1YzDsATSJp2TKlPHMQ3Z7mGg3tCm1exUov8WtDcdxsOvqzqlQGXkEBRLqeH+qi7uaJrfuu
	l/r+yUV6F/nXz3xLsO5wSu+Jv54G2rhUHuO9kQX1jRaYGDtuljrYS6ta+RokE6vq6GymDl2udkY
	WmWGRNxFMxjmLyNh6Y5Inxcu2yK8/fROgpoDlaL0ZrQN9pHwHH5yo6MAGamn7fw07w5ubw84Zv/
	nOLGgyJl7saU1oMw
X-Google-Smtp-Source: AGHT+IEXTIp4yFfB4Q9w6fbdseD2o1pqfO5Hhy0H0j3RnKD3vdKl89OZk1qQra91sAFPJlTcnfVM6w==
X-Received: by 2002:a05:622a:288:b0:476:8eb5:1669 with SMTP id d75a77b69052e-490f2d813f1mr47198331cf.32.1746524014995;
        Tue, 06 May 2025 02:33:34 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-48b98721c43sm69901391cf.63.2025.05.06.02.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:33:34 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Subject: [PATCH net-next 4/4] riscv: dts: sophgo: add ethernet GMAC device for sg2042
Date: Tue,  6 May 2025 17:32:54 +0800
Message-ID: <20250506093256.1107770-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506093256.1107770-1-inochiama@gmail.com>
References: <20250506093256.1107770-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ethernet GMAC device node for the sg2042.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 62 ++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index f61de4788475..886c13cef6ba 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -543,6 +543,68 @@ uart0: serial@7040000000 {
 			status = "disabled";
 		};
 
+		gmac0: ethernet@7040026000 {
+			compatible = "sophgo,sg2042-dwmac", "snps,dwmac-5.00a";
+			reg = <0x70 0x40026000 0x0 0x4000>;
+			clocks = <&clkgen GATE_CLK_AXI_ETH0>,
+				 <&clkgen GATE_CLK_PTP_REF_I_ETH0>,
+				 <&clkgen GATE_CLK_TX_ETH0>;
+			clock-names = "stmmaceth", "ptp_ref", "tx";
+			dma-noncoherent;
+			interrupt-parent = <&intc>;
+			interrupts = <132 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			resets = <&rstgen RST_ETH0>;
+			reset-names = "stmmaceth";
+			snps,multicast-filter-bins = <0>;
+			snps,perfect-filter-entries = <1>;
+			snps,aal;
+			snps,tso;
+			snps,txpbl = <32>;
+			snps,rxpbl = <32>;
+			snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
+			snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
+			snps,axi-config = <&gmac0_stmmac_axi_setup>;
+			status = "disabled";
+
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			gmac0_mtl_rx_setup: rx-queues-config {
+				snps,rx-queues-to-use = <8>;
+				snps,rx-sched-wsp;
+				queue0 {};
+				queue1 {};
+				queue2 {};
+				queue3 {};
+				queue4 {};
+				queue5 {};
+				queue6 {};
+				queue7 {};
+			};
+
+			gmac0_mtl_tx_setup: tx-queues-config {
+				snps,tx-queues-to-use = <8>;
+				queue0 {};
+				queue1 {};
+				queue2 {};
+				queue3 {};
+				queue4 {};
+				queue5 {};
+				queue6 {};
+				queue7 {};
+			};
+
+			gmac0_stmmac_axi_setup: stmmac-axi-config {
+				snps,blen = <16 8 4 0 0 0 0>;
+				snps,wr_osr_lmt = <1>;
+				snps,rd_osr_lmt = <2>;
+			};
+		};
+
 		emmc: mmc@704002a000 {
 			compatible = "sophgo,sg2042-dwcmshc";
 			reg = <0x70 0x4002a000 0x0 0x1000>;
-- 
2.49.0

