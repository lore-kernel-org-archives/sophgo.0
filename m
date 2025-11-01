Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF59246795
	for <sophgo@lists.linux.dev>; Sat,  1 Nov 2025 01:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761961491; cv=none; b=A3YIVzjh8mLXoHiGhFmU8alGNJDKebMkyWu6lSD0N1tn5LeeoYO4DH7om8Y8NyUzfmm2Bp/Pg3/71EblK17cBivodQNrlgX1F2VXzVJFARJnuCfmbNq1+okmyPznRv8m+Vjng4SR6CdysNWbnOeMAUVZfvvgra5mK5SQgR4orjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761961491; c=relaxed/simple;
	bh=gHKwX7PP5gGOlLXqIefFTY7ny3XOT8J2aK0JKv2/Ofk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9ofCD/OZ+PBK34G0ctqa3MNCTRgsPxhH2XjMS/u04JJJpi9YR+MpS0WC67AJX7pUKgAGQWhAfRHBYn5ZDcltYU4CeCKqo81JxDNfl/ambSyGCqX1j0lXKinDayaxJqJt8ZG0j3jJJz8OLaAGt/ofH8TaKGZ9BBe6JECCh0NSCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTzRC7H5; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTzRC7H5"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-33d463e79ddso3468069a91.0
        for <sophgo@lists.linux.dev>; Fri, 31 Oct 2025 18:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761961489; x=1762566289; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDm1+WSNoDjU3S+YxmjJ+3pKYEs3Q0EpdQk5O1Ku0Ho=;
        b=VTzRC7H5FPNH0V3ox/Dq22N2mM37Dz2b/dEolRzSbHjKLZxvEP8/SWEUNCwTveUWrn
         AujIG9EcRDf8P5uSRlYw03mjLd7UWDBumzbFKBhyQEi6oHe1ls0glLWU2R8sKSRg5Djj
         JVBQ7OSNJOcA6Pfi1KrcyR4HfQhnoA7DKqyuX4E8rAC4awIkyWv+A3oZ69GBuQPPsBf5
         RhibdRVeWuSwE+TsJI1IOKIVw5OZaB1sUSAOYFZR1+ItW2YuxNEc7I7sYOLVAUELtSrf
         srukqAiwAMtULm58RSMFG9OPBf3DTtuFNkT8Nfb368R7eaIHNpW9rx+R8l6azzbc4ZsB
         3N5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761961489; x=1762566289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDm1+WSNoDjU3S+YxmjJ+3pKYEs3Q0EpdQk5O1Ku0Ho=;
        b=HhjM+N5T9hTwmun7KeaaJicGF+276b27KdU6xV/owpvLQIHhVrO8iXMp3vRwtqHr/e
         LkknPFIwWYZb/S6rNJsSqjgwIy+zy6GKRU9P6EnbYjnrLvemBeeEuvPl68WN2A55eYS/
         wemEbiGc+KYvVV6ISA0YmN1EEKcvHxx2H5YuLwrS7zfWQjl3KgbcMcL6FYzsXdITzy2o
         2xSLluhdxCN6lO5JNxJPBU8ubjeGVW4x2T2zru7joteSNqjLSMiYiSZB9ZO5SP9K3utQ
         L7XvKTab1ukPUTOpBCqACl6v4Hjss/omWzhRazGu7NzJSUYkmD9T++6GScBzGNs3XAFI
         t/lw==
X-Forwarded-Encrypted: i=1; AJvYcCXDuJuyfibkFxiGZkA7Rc/Fv4rACrLRE6w16P4kpS4OBdhVroLoXzKsBLzxi1db01RuhiVPt+Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YwfpEPNKnPof2D4zpXJPKFezxRirhVRkDbVS3eZmV9uEDnczeb1
	lqnA/3iM0SAZqBzxybRGVYTAM/A0xrkxc4D1AV/+QzlLuFx4MEH0SSf6
X-Gm-Gg: ASbGncszs6eOgRjAzHSVON+Pz/qqWiRZDwyQoFCJdm4SwtZSHVrQB/R/80Tm+hjz+T3
	5UEvIWJILNLiSa0/fvCVgKeGIiam0btlP4/o0LmwyrM5KQ5NlVR4ukAFBabW0gRcJZKLEb4sPzw
	Jkhw6kZTAPJ1iW0CbwVHyv57sB3bSFtK1cBSFrnLq8LcGEkSSFjgEh+1dLCb27QLSike7G3hrIn
	jB7F0Kwb43+709ctINMzUC8H6iqErwPO1oDQLRGCNGSbYiWwCQjQkRN7iaUiZcFo25s0mM0FtTL
	XmNoCa8feSAKqvs/hIKrldxkz4UpQpj8juZHBaDa0O8+RBovHlbaZuyU/+FMFiVXpwoeVMxsWl2
	tdm8dzeScSNuLLB1rN8klw7U5bH4NrAHI7Nmrxma22SiBaE63Sho/onMXTIEYI3i6K6HTu9hEs6
	X7NpSLV7kVyHqnqX5VxX2KOn/uMqo=
X-Google-Smtp-Source: AGHT+IHCcU4e+DqHPOrwiHTkTGTSDdoO4ULRyleIswiaTH0OibjXfdAmKn0F8G4yAJ3McQ4Uax/qcA==
X-Received: by 2002:a17:90b:510d:b0:340:c02c:d2b1 with SMTP id 98e67ed59e1d1-340c02ce1a2mr476048a91.1.1761961489084;
        Fri, 31 Oct 2025 18:44:49 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93bf078924sm3350585a12.32.2025.10.31.18.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 18:44:48 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 2/3] riscv: dts: sophgo: Add syscon node for cv18xx
Date: Sat,  1 Nov 2025 09:43:22 +0800
Message-ID: <20251101014329.18439-3-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251101014329.18439-1-looong.bin@gmail.com>
References: <20251101014329.18439-1-looong.bin@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add top syscon node and all subdevice nodes for cv18xx series SoC.

Co-developed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Longbin Li <looong.bin@gmail.com>
Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index ccdb45498653..42303acb2b39 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -25,6 +25,32 @@ soc {
 		#size-cells = <1>;
 		ranges;

+		syscon: syscon@3000000 {
+			compatible = "sophgo,cv1800b-top-syscon",
+				     "syscon", "simple-mfd";
+			reg = <0x03000000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			usbphy: phy@48 {
+				compatible = "sophgo,cv1800b-usb2-phy";
+				reg = <0x48 0x4>;
+				#phy-cells = <0>;
+				clocks = <&clk CLK_USB_125M>,
+					 <&clk CLK_USB_33K>,
+					 <&clk CLK_USB_12M>;
+				clock-names = "app", "stb", "lpm";
+				resets = <&rst RST_COMBO_PHY0>;
+			};
+
+			dmamux: dma-router@154 {
+				compatible = "sophgo,cv1800b-dmamux";
+				reg = <0x154 0x8>, <0x298 0x4>;
+				#dma-cells = <2>;
+				dma-masters = <&dmac>;
+			};
+		};
+
 		rst: reset-controller@3003000 {
 			compatible = "sophgo,cv1800b-reset";
 			reg = <0x3003000 0x1000>;
--
2.51.0
