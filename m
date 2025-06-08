Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351732676D1
	for <sophgo@lists.linux.dev>; Sun,  8 Jun 2025 23:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425388; cv=none; b=CaZBisuz7lTYk4H+5NwrQ/1L8hEqhd5a0Bq533ow9l6KljVS/Fj6v7ysOQQ1Lf2v1bBh9RbdS4yCbOwrr/o0MM35v9NOtXBnCuRwLYbywopNmZc0OMPTPM3qEM9e71VcP5UeMJLz6MCH97aJ4EtcfeqjY7MRpTXmI44pVTMFMVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425388; c=relaxed/simple;
	bh=4thjQyWKFqJ0Z4KGRxINiQcOw5O22+CVxgUdzvhpDFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IpogxlvU8otSsdOFBYI56fwEW//9BKNyi2bM2JY1fVHzmtljYZQB8stJu4XoiwRsQRlmknhjbNC0e6Ha0XMU2nzxzMonLlgLkmPdBksW6nzPA70+P2gfgjT3pbumo1ezwyFW7coYX4KEuEr0+WMQISg1X/BfVt/pV319hXqf4qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4yEAqlZ; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4yEAqlZ"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d21cecc11fso645632885a.3
        for <sophgo@lists.linux.dev>; Sun, 08 Jun 2025 16:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425386; x=1750030186; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCb6v/f0HspzS243Pz/dNvSdYY/W6vQ50DJnwXfCQFM=;
        b=g4yEAqlZY92FSGcZclFHcc+r1TcZRdkhNJP6uoMDmFxqXFztMS4zBVhucDAgoQ/1jv
         uXlVSB2ymAGXx6aIc3sB18bfC67LnUMaMALXxwyQvZzLg8Arn1trmGlFqLFhD7Xqm0nM
         gsz3aeEEQAHQzkLAnqCpJc0WfdfCRVfnnG+OrZ4WnZRJJTcFNgomJNnq/biiXHFY2Dem
         R3Hl3//LUMRFyaCBfP5BzSNHpL6qEPSnmGGte/9tQkEoiZj3L2ICLTbvJ7Igc6Bx8gFl
         JJAYd1oYq1Xj9jNA5Btk/s2AOc23jyIHMOjzpYgvAgCBNAe7vH0limOBOizh4f698nn6
         CzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425386; x=1750030186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCb6v/f0HspzS243Pz/dNvSdYY/W6vQ50DJnwXfCQFM=;
        b=TT6i8a2VTIZq0z8oB+I3oRYU2WoP9vwrVK8vpwUhFxTADLsOs+niDsWvQ2dLbkTyHp
         lw6mrR4hj0S76GcET4j0GEonpPRVa28n98lpYS2MZnq2eDpBfCqs7Uh03q/Puj1WRRXC
         9ralIzOn9CcpfUMKHSxM9Nj6fyI8z0ReV12klgpzJB+MnzMcGCFCTDycqxxY4lPu1M0x
         BvwnYedNbgcMZHKZLFzsjhplsgJ2ez2bia+4OKav5LuLpDWr/mJoF2eqHAHjHgOaR1Ut
         ERZL4plgFnA+M6NXGZfp9AIsU4de5yjihXY/8n95CjSpt/tbf2xkJWWruWxb76+sHoAy
         ZQ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhh/08oFgqM2/eKndxWWXmwul6ZYau/gXfkNxFwO0R+cbNDkPC8G3bWIlfnSpkCmrjTQfieDM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwYzZ88TC11FHzSQVcF3OGOll4Fm3MGdgLm2QJ677jPholpRRXq
	GKfo0tXpBNTIxJP0ckQKlwYaor0bTra4CW6Qr3AOUEkCBQM3R3zadvMa
X-Gm-Gg: ASbGncvx/bzgzHwMIgKAQ+6R3Ev5jogAndoQsAQEEvDB2k9N6mCbkGNwXpn4A1IrlYi
	70P1BsaP/mFa4y51IraLhc/UA2ur69To577kDVHP+07GNMNvCDcyC8hx8uCJq7MOjbf+oQRoKdK
	jKJHVdsxOTvpYC4Ji6OmKW4LOWbM+oz+HfZ5AARIcHw8iJ8CemELKDSslTv6URHj6Wl3cnoMle4
	kRm9dRXRxp4VcyFLyMsvaoPFIT0/+n5/5s3XSa6cOxhXeJwhf/jJLLR5Dnu875nv8Jmx8MpK8EG
	iiqjA9Ej2mqMDEWyOtCHY+rqBG926946C9lK+g==
X-Google-Smtp-Source: AGHT+IF1BKK0uFTInialGKijH/6k16MniaxLSvYp4PMRIjXYhZYA5hYo3Y7cvlg6UD8+EGsy2nqTeg==
X-Received: by 2002:a05:620a:1a8b:b0:7c9:1523:3f17 with SMTP id af79cd13be357-7d2298ed2edmr1567583185a.57.1749425386115;
        Sun, 08 Jun 2025 16:29:46 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25a535794sm465946885a.26.2025.06.08.16.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:29:45 -0700 (PDT)
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
Subject: [PATCH 01/11] riscv: dts: sophgo: sg2044: Add system controller device
Date: Mon,  9 Jun 2025 07:28:25 +0800
Message-ID: <20250608232836.784737-2-inochiama@gmail.com>
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

The TOP system controller device is necessary for the SG2044 clock
controller. Add it to the SoC device tree.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index d67e45f77d6e..a0c13d8d26af 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -76,6 +76,13 @@ uart3: serial@7030003000 {
 			status = "disabled";
 		};
 
+		syscon: syscon@7050000000 {
+			compatible = "sophgo,sg2044-top-syscon", "syscon";
+			reg = <0x70 0x50000000 0x0 0x1000>;
+			#clock-cells = <1>;
+			clocks = <&osc>;
+		};
+
 		rst: reset-controller@7050003000 {
 			compatible = "sophgo,sg2044-reset",
 				     "sophgo,sg2042-reset";
-- 
2.49.0

