Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A262BE039
	for <sophgo@lists.linux.dev>; Wed, 13 Aug 2025 08:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755074048; cv=none; b=KKXJhzEaP2eVrDgfNZH9ByRLMIcTb63HXlZvdKL99RIuZ77Fn2CDThq3H3vDm79H4O1tNusiMOtDSqRpn2WxWefZ1ZuWEztrlFN3FegWdv2C219Sj/wrguqW5qzJZCZu2bPurc53GoojS1ycZdImkpE+0oP2Buvygh4+w2k5H8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755074048; c=relaxed/simple;
	bh=QR9rt1dx8wRY8ZK0TwZiHfOAeokIcX0oUcFGhOLvmKU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aMgeODANe7XO7gNseuBboEs4lMAxAHgcCFfteRN+kw3JUb7bGc4Hy+/uqJEYsEvwDe8itrvlGl00LQoeNtkGO5RdXWjA8RlhiiBDK4EAdSijOdZn74rN6qMgY/PfyoyOOyDqrWfedj3W+8G7GKxTzkDoNVf8eN0nWgTRTFIU/iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZ/LEEBA; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZ/LEEBA"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-76bd2b11f80so5842195b3a.3
        for <sophgo@lists.linux.dev>; Wed, 13 Aug 2025 01:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755074046; x=1755678846; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLh7Kk4OYjALVNhIIaD4wUDlSppRWWz8p4xTrDTK0VU=;
        b=gZ/LEEBAj5y/B56nawnYEMaN42Di+t2GfCfRjQ4utTfzg2yoCWb12QzDjaLXT+UXVA
         3XFea9cpeXLAZ6ojo0GW9u9eW/xGaKU8EtXi1J9w18Qt6Xs+pRz1IhFZS8RaW0ARsboB
         c5dy+tfq6VF/Qpva3rxXrr3hKmemLBZ5mMllFVLMamtr5oVF4s5tlR3s9bhZWnWQp2Q7
         KShiIQQJiNxYNQI7NxsFs2tCdmoCeI5zKFzwzri4V2rs/62bu+beKEMKPsRqF62/73tx
         AuQh07mvv8w27YD9m+m30K+w23ARS40BFmV/jbbutRXiXB4rq0sj+yTgrUwSDyjcEYtw
         nTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755074047; x=1755678847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLh7Kk4OYjALVNhIIaD4wUDlSppRWWz8p4xTrDTK0VU=;
        b=ND1bSMAfIgZTPJv7h1C7riwVDMZNhHKBt0C4ktLX2eJvs6Xj/ocFBJR0agzg1R3B8F
         +vm9YoppHUGUCtS5XN2A8f86L6dnrZihEeOOH8FmuacsN89GQ/oQKRtT1JWXQHLG4Jik
         mLXpRvhhL4WVAKSK3gwhrT8JBgKSpPunAdS6Zv7WrOBa3VbvJCBqtF5gHfxotQ/x+pxI
         HKcZSkYMRYXpsbXJ5wqsxFkkkBz+UU0FStk71mE0o0rLJB5lhInz2Rjg/ivAzw0I4p1m
         wI0Zk4fqNPXZIZ8BFUK/IyeWHM2dZbJI+9x6vCwYBbAai6AA7iNSOGmRS6wwl4SAi1VU
         zmcA==
X-Forwarded-Encrypted: i=1; AJvYcCXytctE+B79HclZL0Uc7gQiotdpeVkFUtvs5H60XVLaQ2SRpbd1rA0cla+dAgu2JStwT1uUKkM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0HNWXn62DEAYvewBavMegeO1wZk6/wzkiKXy24lqE+cW8PFJb
	O+euJJ5clQEcGfMdnqnK96UyQLLf2NP1dlp571fCC8KSH4IJKKTR6b+Q
X-Gm-Gg: ASbGncv0Odx8rG12eZ3y+mlA7SugQTow86AcPrzCNJG5Yc9UQYKCW4yo03aQNT+4wHx
	PnvpotZr5zIWQuS2jrXhMg5g8UDt05fJH77Mkq7ShcprPJ7skT3XtaIxurxezIlX2ekhE3q1v3Y
	SmZTbwtkbTcCztGc2phMyiFuzy7WaHTsQGvyTElB6FS2BtD+AgTIjUYtu1qrYaF14fvob8NN2WS
	2TRXjN33ag9V5cGca5AotGjLhz07JXQOdxBGqh/nN+rr/wez3VaGryREuaB/zZQC+MSvTgePica
	eH59nL8ZplwFDtB8eGy9uWaXW0oKn189kP4xH8lhjyCFxp3jca6lV00Asx66nb0B8O2HiZ1FA7j
	NNS0pSjyDOzlpz9+YRpoGDXrnACrXNzu6
X-Google-Smtp-Source: AGHT+IEEUcjPWyW3+EqWvnD5E8+0bREKP1ea0Z5KKh4lSYDKYOfsw0ft79JZxtY8fSAzLb94o+PTcg==
X-Received: by 2002:a17:902:ce8e:b0:23d:dd04:28e2 with SMTP id d9443c01a7336-2430d1ab47dmr33684355ad.35.1755074046271;
        Wed, 13 Aug 2025 01:34:06 -0700 (PDT)
Received: from [127.0.0.1] ([36.255.193.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfe50c8sm31307814b3a.120.2025.08.13.01.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 01:34:05 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Wed, 13 Aug 2025 16:33:20 +0800
Subject: [PATCH 4/4] riscv: dts: sophgo: Enable SPI NOR node for
 SG2042_EVB_V2
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250813-sfg-spidts-v1-4-99b7e2be89d9@gmail.com>
References: <20250813-sfg-spidts-v1-0-99b7e2be89d9@gmail.com>
In-Reply-To: <20250813-sfg-spidts-v1-0-99b7e2be89d9@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <rabenda.cn@gmail.com>, Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755074006; l=916;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=QR9rt1dx8wRY8ZK0TwZiHfOAeokIcX0oUcFGhOLvmKU=;
 b=Uus7GJwPp8hyacJ983Bo8pDUNcIFyjii86Yas9FPuyQSkIFFV67tvExpI9nc3thUzuBPLdj6T
 1EGrsJin13jDKhinFEmR0uA+IEAu/ygtsCjvUbhfQ/hJiUnN+AuWnom
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Enable SPI NOR node for SG2042_EVB_V2 device tree

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
index 46980e41b886ce17dacce791fa5f2cef14cfa214..7001d8ffdc3e04c5a5cd5da85a4fb1c0351eb9a5 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
@@ -226,6 +226,18 @@ &sd {
 	status = "okay";
 };
 
+&spifmc1 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_cfg>;
 	pinctrl-names = "default";

-- 
2.50.1

