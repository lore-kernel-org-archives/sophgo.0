Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247F91CF5C0
	for <sophgo@lists.linux.dev>; Tue,  1 Jul 2025 01:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751332684; cv=none; b=ikZd8boRjIX7QWnAM4nCU29ExswVpPtQCgNoX/U0Gh9YmBDFsv9R0Sd+qJpFyCmAJEcCO7KSCJnIo4pB1MqOPhdmVhKpVl5AGMuq0/3ujqxcAsWdgUuD/VGAP9MawBj6FbSucpg+SK/J4ceDKcbPZlBvUIzvECmU1OT6v33/f0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751332684; c=relaxed/simple;
	bh=Hq80mkzOm4sDH1lo61LQlZ+WhvZpGs/2+0D69YVEncc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iVyLMcBeklQR3D+98Ju+gTCYBm942F/q4dLDd2uLktoAFrhcQVkPIM7IyMvdes9o8eVCRJVmQSBGs7H9i0tofDxjjWRsJq9kQCQ6aWzUQyOQPvoP2xMyNRLBK0B5IXCmJrCerzg9Nulq3j37C/CotwWDtcvjyDLePPSNAiPnyw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NELMwYEo; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NELMwYEo"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-31332cff2d5so4192486a91.1
        for <sophgo@lists.linux.dev>; Mon, 30 Jun 2025 18:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751332682; x=1751937482; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnJ5HyRFTLzSb90lPZ0kytxtuJ4Ps5kIpRokWvdn6qw=;
        b=NELMwYEorQ2LLq2Qn8OUt1/qJls5nLrWXORARFS++4HpaYcIDAIYIggyihgpKD+0kj
         oeIehdbEO9lro/EF7eOLyWpP54ESJFs9yujxtFkHce02leS6B72zPpELMe+oLOnkfFe6
         ZJuQlIRfjijhZro4lBQbi/TkIQl2uC3JT3Ry7lB5ky4fDT9fndSDTMAE673iZuEd2var
         +5yut1l8Tl16CBFvOaHt/Lv1P7nemLkZepdrymDnc4uiOUOgch8S72Ozsi8esEjCr/C2
         4WQObzDeihie/vy9mEWRa36nMLeUeS/DcfNhqp2OPBz1vOTwpAYnVvcF8aEPNXKcLUVi
         f7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751332682; x=1751937482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RnJ5HyRFTLzSb90lPZ0kytxtuJ4Ps5kIpRokWvdn6qw=;
        b=v5s8ifuwdmuvNO7B04Kj7+c7RAx9NbggHBuvlStlgU4hj9R5uTvmXYzOEjuaVgzGIe
         s2RU9U/uozRP36mPi+zaWzo7LuIYjfdMUY6qvVnNxzNhMPmpar0g/AFx0mjQF4f/U6RH
         YugLUR0pIMU7TwTt/WbOc/esFMzeivNsTLdfeZa+1QvzJB0upOwzgbUQ8+mzgJZ7OZNC
         7SK+dXAEBjguT2ccxVLuRduZayKQ5PhSf/qlxAyTZTF7ACsqvBWz9gaU2sN2uPYHnwzL
         MM98rc5ZbfKuQOSZIYRFNxJ1XkDVoQJku0qfpjikfxd2JsQo1FLlpOV7ilsWNCVJP7ZE
         a6NA==
X-Forwarded-Encrypted: i=1; AJvYcCUiKinVwZji1fA57dM15z8784GoC6+0js1l4ZThv3n4IDSZ2VFCjrKK/WgFP49HTDtZuZz2cjg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJlj0AfaB1RSkJOQY4pS3aoXI+3B41eM3YXzMda81AXtuSi0M3
	+XYwBc5Zfj9Xo0CWxkVQWkurwkqBycrSivmSVy92/CpMdw3zPRYmkkrz
X-Gm-Gg: ASbGncvyyMXEAITFPMvW/OQg/kAEaZT2TkT4QgTAP9OhSicgPs5/kMLwtUyYgDk62UV
	UlTbIclq0RuSllSEhvyw6E+1JrsLB6OM09JYQdjwGi94O1DpwPEe7zIP0X7EQcScBZkEjnrvRYU
	O84kRxpi2Ecc2eiy1kiYE9h7yzwFAGpgqF7kRCvKkOVa2QfW+YL9iQGmArNUWJXPm74eu6vl5yv
	XvmJz1l2X/pBi/Dm79XmG+haUa7C1q+dIgJSluYyaFso78nPJ0rnbAuE9WExwKWH6BnLuv4JOLb
	2MpVc1cVXn4J8hkcWUjUxHqE4TEr28jTCt6yX+wah4rq7w+W/53/Kgguk7jpv7+Sg0KbIvKy
X-Google-Smtp-Source: AGHT+IHrvnGB8UpVmo+G36End1O2GSAjnGffQVOqmnvZs9oxeWkVGDRfXR2LbK24Xq3v+GU2Rm3BrA==
X-Received: by 2002:a17:90b:528a:b0:311:d3a5:572a with SMTP id 98e67ed59e1d1-318c9225e52mr21546386a91.8.1751332682255;
        Mon, 30 Jun 2025 18:18:02 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-315f54417f7sm15446402a91.45.2025.06.30.18.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 18:18:02 -0700 (PDT)
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
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC v4 4/4] riscv: dts: sophgo: Enable ethernet device for Huashan Pi
Date: Tue,  1 Jul 2025 09:17:29 +0800
Message-ID: <20250701011730.136002-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250701011730.136002-1-inochiama@gmail.com>
References: <20250701011730.136002-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable ethernet controller and mdio multiplexer device on Huashan Pi.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
index 26b57e15adc1..4a5835fa9e96 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
@@ -55,6 +55,14 @@ &emmc {
 	non-removable;
 };
 
+&gmac0 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
+
 &sdhci0 {
 	status = "okay";
 	bus-width = <4>;
-- 
2.50.0

