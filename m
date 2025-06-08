Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E98E2690ED
	for <sophgo@lists.linux.dev>; Sun,  8 Jun 2025 23:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425401; cv=none; b=PnX6UFQntw9O2+meXLhjPuch62HjSOvddrkz7S1il0fMaLuKKLgm1bDFMJD658oXsjgjTaQvn3LoFoKr2K1RniXa63/DmCU1rBUGsiM4WESFaMHFjxNdOKhe9NtBrX+Kdc8eMWPxJROTiKsddQAYrSWTdxHU57wnBa3KhNgG4nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425401; c=relaxed/simple;
	bh=0wJ/HWUUsDvlvcs/Wp6NepvS/OITvhDLuYG2E/dbhWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mD9wW2+DT3sqGsNx/uSiDWNjtgwd+mLUUDTXMdN8B5GFGDT0eI27HuDJ2VdQSoEsKIjMCKp9XCMTuEGih4K6kub3IHAJujEZ6F/MM9P/SjSI74bzi/eWZHZy3kXNzRQFaAs2GFLhixrkzmQTNaIk5FH4Ir9tS5HXAA0c5R6QPD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJ+qt2tz; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJ+qt2tz"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a44b0ed780so46949831cf.3
        for <sophgo@lists.linux.dev>; Sun, 08 Jun 2025 16:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425399; x=1750030199; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIbMjxTvPEYfM1wLVh1S1rjKcW/pphi5tKLotbN01b8=;
        b=MJ+qt2tz/0fdAyDA96T5ZZT0Hs8j7lMfqebug7S51VHc3LLgIj/Qc5/vWQhxoJ7uxH
         VTp/oJTPLRhUo4bNusD0oFG0fRs5uCrxYOZbaZMHd2Sh4DlhYXsz/X5Z7zPF4mnYG4ni
         JHFoV29naQGVRNkGkMsu8ayohvTx3poz4KfD9xIlGD7dGRDt+iSfZ4k3iNh6rGaO1m1h
         p1Dti5vWi3jtDNB5oqtPJHHfL/uPAfmbN/zKUGPejDjKRKsDohX4wGxvJ9uIT4zQqKNj
         Vd086SD5TbciJiJ6CMbfTnYOtoi+YUAFv3oz22kR6cOT/jfJ2t5wTgVOfbthWozQJeID
         /9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425399; x=1750030199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIbMjxTvPEYfM1wLVh1S1rjKcW/pphi5tKLotbN01b8=;
        b=W7OsryhKiDnppFYIv4X9r/HbCEA5ZdTdWhQR64bEiJ4xpJ0vHdfKeY0uiMxK5S06qL
         waQCPBQ1lUOEjFgDGgQPEVpwWjJjFh19Yop5YD/eTQlq6kUcYVJJ9vxS5qZbF/emyO6U
         F2LYgXT4srIl+dLjgAMd9n36yoPQ3vt6ERdzj9YK8+zwZH9ZiuT3iTh4i0giCJirFZCl
         GWsByJikd71u4aahm63Oy8E/gdWJGrys5ftPuI0rtYv5rDTakEYfpaSJbPP6Nxu9j3RW
         NKckd1Fr6YvjG3vyVRLWsQ0/JrBddGbQFw6sNKsYHSVSR+/bV5oy6h/OZ4A6rwyfhV0c
         /TtA==
X-Forwarded-Encrypted: i=1; AJvYcCUK3GDtNmEvYrU2t1lwzEBauMLZd1k90KB+cdQA92rFhokzGBDfAIACIaz8jNOAP53HqB+MAFk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqsHaYxcCcuotqEfZ1bzPWSSTbWMPjh5PCOUPseXJg1GuVicah
	tGz37SvcShtKK5cMJ2Yz9T+vRhEXjqzfBLLtJgSe2c59Jbfa7d67WD6E
X-Gm-Gg: ASbGncvvkCriLy/Pwa3cSGUi1ASpN5cBYtOR4Z0QbdOl2wDLSR0NSKnFwS0bpGDhZeQ
	h7PZ3mrZI8kcb67721wbDY8spXQJ2oOxTWZ3XdUzCV/gLUua3coHbg2qbXcCnnK8oDhwKvmwID4
	rJmhO7xrT3WdvE3464+DkjvgPIkcqIuaWOTBO7joZzB/FDkT2zECnRoYJYe45mj/Y3+8iVqdboa
	VKELrD7jUqXqJLd7l8MCYNjcz5WcJ8jpnKx8QtbkAGK61vUvpQ5g7F/4/NmD4qHJ0KT5lag0pyX
	8Wgs81jg3nN6RLAyvpJy5zc9/0cvH95Qr6d08FRRb7Y8olMC
X-Google-Smtp-Source: AGHT+IGZUz6F5c0pXbN6o8Jj5csJX5GQPNNaA7JPElzs5JJ3JB4U3Aw34Dkaijp9bRjqsXUX+NbBgg==
X-Received: by 2002:a05:622a:5c87:b0:476:9474:9b73 with SMTP id d75a77b69052e-4a5b9da89c4mr211494501cf.42.1749425399168;
        Sun, 08 Jun 2025 16:29:59 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a61114ff23sm48697571cf.15.2025.06.08.16.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:29:58 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 05/11] riscv: dts: sophgo: sg2044: add DMA controller device
Date: Mon,  9 Jun 2025 07:28:29 +0800
Message-ID: <20250608232836.784737-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232836.784737-1-inochiama@gmail.com>
References: <20250608232836.784737-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DMA controller of SG2044 is a standard Synopsys IP, which is
already supported by the kernel.

Add DMA controller DT node for SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index a25cbb78913d..a4d2f8a13cc3 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -31,6 +31,26 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		dmac0: dma-controller@7020000000 {
+			compatible = "snps,axi-dma-1.01a";
+			reg = <0x70 0x20000000 0x0 0x10000>;
+			#dma-cells = <1>;
+			clock-names = "core-clk", "cfgr-clk";
+			clocks = <&clk CLK_GATE_SYSDMA_AXI>,
+				 <&clk CLK_GATE_SYSDMA_AXI>;
+			dma-noncoherent;
+			interrupt-parent = <&intc>;
+			interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
+			dma-channels = <8>;
+			snps,priority = <0 1 2 3 4 5 6 7>;
+			snps,block-size = <4096 4096 4096 4096
+					   4096 4096 4096 4096>;
+			snps,dma-masters = <2>;
+			snps,data-width = <2>;
+			snps,axi-max-burst-len = <4>;
+			status = "disabled";
+		};
+
 		uart0: serial@7030000000 {
 			compatible = "sophgo,sg2044-uart", "snps,dw-apb-uart";
 			reg = <0x70 0x30000000 0x0 0x1000>;
-- 
2.49.0

