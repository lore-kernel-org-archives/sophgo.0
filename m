Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB071A304A
	for <sophgo@lists.linux.dev>; Tue, 13 May 2025 20:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747168318; cv=none; b=HmPSDKvQ3b8+52vriS+NnrezwcWbKIUZ02q6tPxZu1Q51aXH1vWR/vhVsInHadHfAzxOjudYpzogsYG/pnMtwtvtfZCExfFT7+n5j9w5QcLs8pwg1B11Iqk4tT5Bfn2kppol00xUI8NShCqxayGw9R7KZK3BziF3QTUIXlWbFhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747168318; c=relaxed/simple;
	bh=jfRrkp9lyFao9Pp5oLQGET38LS9Y36udY/vg3tP6iQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bj+eyHF2B6ymqxMDqhhpjxQ3U1Nj9/2XK10hrvYx3m1gtr82JfdEQifk/WGoeRgoBCDSevlF/z4JxqGaQjuGchWwTPBSDnzf44SizEsyHPbsAAFqjj5dw4wbdhB5LwYjZaW3RTxdbHVoKpnVCILPPjo0XqXt6CqJwaZsRDj8SWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBnQjV1z; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBnQjV1z"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acb5ec407b1so1042774466b.1
        for <sophgo@lists.linux.dev>; Tue, 13 May 2025 13:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747168315; x=1747773115; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WCZ2i6E0I6gwRQJDyVBo1njeILo9WXLxHiX21CXlaCc=;
        b=OBnQjV1zP0U334dXHfyLRFrskuo9Fr85azwIsfPdou7wwCx2gagIc2C/1+RBpS7N1Y
         e+g/T+Kndk+DqwmLhwIGHIq9VLizXX/Ts01Go7IAXn3C4qKzDzZM6QmBkmKnm1O9/cMo
         BMsmXuQIq33dlI2CtY6NSQCCVIC0K0hUVW/W2v2PZkCi4aNeIFcJCq7rJsVTZBJWXhmL
         CZGPA1smEeH1UQl+oi5qWMYYyKqKmOcECG7fFTfwT/XqrbPUGBtQPqo5UbteMqU89Qow
         Pb1XWTFeX/mvIKxzuep+AlYxF8SzCNGYYSmRYC7sOUK/ld5HSdFL9gQQ2bpZpJCxgRS3
         O0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747168315; x=1747773115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCZ2i6E0I6gwRQJDyVBo1njeILo9WXLxHiX21CXlaCc=;
        b=wZlND8KTgzH9sbRBXzXfeAwiXO59BWU5pEJqhFOWagZNMdmQNwndRK37jdv388kv+2
         Iru15Aynm/R4qXmQg8AHec88gKQ+qm8L2siPL4WPA9dpmHUEOWwaQXh2wBawF/nuitCH
         CgtCSwJHP6GsaArrPF9EvSAh2Q488cnNK/cz+GIh22jf4g7NVhgOoXSEtCs2sS/soNVA
         XbZiKhyzf9l2zl9U9eshJPrfVTcoAbRuAbfpMlqaYKL1d41JgkMMJEGCVoxLzCc2J3CX
         ejrAtf7zWdMWonclX4z8x1IRxOLr3zMEHZ313X8EcTEx9N1kYDEajLKkH8WzBC5DW59A
         7Qrg==
X-Forwarded-Encrypted: i=1; AJvYcCWw5uxFk6YJ8zxk404LWHd9sAy7M4gvQv5m9YbHePq519fQ8wEjo+ZtYMnigiPoNFg4YvpKON4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2VXcgkTYjvM14N9evGKkSawS4QbnS+YxLX0VA7WXFpdXaEDNP
	tszMymxSbdgLblJffymoBCOcAJCWjOmTdxrNImlFQ0q79N30OnIoktFsZRrhXXY=
X-Gm-Gg: ASbGncuxRHc1VmyxyKSMsVklvQKBPLCbdhqSBHZC4PG3X4xTiVcsf7sMrrKAYayOMy/
	11zTGbsmF9bRHEwJO6rsLp59ulJusWrGDr6kw+8QenUbjvP6EBUgLGnL9UgqkidAmGGnW7EsV27
	Ub0VMjLU2Da5dnVtPJCl7ZuQsydW3Ib6BmX3m1jol4z+aqes/tV7BGpMu+yIQAXg2y7bwimgOip
	bCJ3OQoA3B4WLPp1870eS8D8hKFCSJ/NnzaMGrOzYqFbuc/+QhcQ2d5+kLfkpP/Z2R+dfFRG0tO
	GpdoOSNgZ49iHEDtrboxkeb3qnJfnBiohKXxokTMOFDjXwx7nKgQ/wmol8RTM4Bo
X-Google-Smtp-Source: AGHT+IHjQ1dMS6usnLiHaz4sXCz7Jck/zY0kS9uEoTI505F+c6LZUIo6wME/2RdA32p259FKoLkbrQ==
X-Received: by 2002:a17:907:7d8e:b0:ad2:50ef:4930 with SMTP id a640c23a62f3a-ad4f715a442mr96322466b.33.1747168315249;
        Tue, 13 May 2025 13:31:55 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8508sm819349766b.9.2025.05.13.13.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 13:31:54 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	sophgo@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: sophgo: cv18xx: Add RTCSYS device node
Date: Tue, 13 May 2025 22:31:25 +0200
Message-ID: <20250513203128.620731-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the RTCSYS MFD node: in Cvitek CV18xx and its successors RTC Subsystem
is quite advanced and provides SoC power management functions as well.

The SoC family also contains DW8051 block (Intel 8051 compatible CPU core)
and an associated SRAM. The corresponding control registers are mapped into
RTCSYS address space as well.

Link: https://github.com/sophgo/sophgo-doc/tree/main/SG200X/TRM
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index ed06c3609fb2..280c45bd3b3d 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -307,5 +307,17 @@ dmac: dma-controller@4330000 {
 			snps,data-width = <2>;
 			status = "disabled";
 		};
+
+		rtc@5025000 {
+			compatible = "sophgo,cv1800b-rtc", "syscon";
+			reg = <0x5025000 0x2000>;
+			interrupts = <SOC_PERIPHERAL_IRQ(1) IRQ_TYPE_LEVEL_HIGH>,
+				     <SOC_PERIPHERAL_IRQ(2) IRQ_TYPE_LEVEL_HIGH>,
+				     <SOC_PERIPHERAL_IRQ(3) IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "alarm", "longpress", "vbat";
+			clocks = <&clk CLK_RTC_25M>,
+				 <&clk CLK_SRC_RTC_SYS_0>;
+			clock-names = "rtc", "mcu";
+		};
 	};
 };
-- 
2.49.0

