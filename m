Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E22728A3FA
	for <sophgo@lists.linux.dev>; Tue, 26 Aug 2025 01:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756170603; cv=none; b=MdYcMKWsOTu4oxEB81TMUgm9aMW9f+Z5RncYthe0ZxMe5MMIPBOdy+VhFLBWNcFVLc3gcXaQBRx8Gjr1EWaZUBEbDpFvI9t/qskvTsLVnoTCGa/A/jB7OJjZrq+XTA3YV0R0Z0S/EK1HGtmwnwnFNfeaT9/GnPY4yxuxDYhZ82w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756170603; c=relaxed/simple;
	bh=cnETHiuRSssaBEiTgdPtwlHAn/fBOMXmkTLrBzYJ84A=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AUUmMj11+VS3mw8O/CBGC/Ku3AxmNfHLdp/xthLu1ODcSIzpn6T1xg9RRzvLTJgpi//MC4P3iBnT7NpP9coHslDjhHE9LeGoVwIECOtY+okIhC3fofTpmidlcWq1f1v+E+eei6cQ64dEOrsWTtOYtBNd5DvjFjkLA5HTDKJjze0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1Wv8Ycu; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1Wv8Ycu"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-30ccec928f6so1518458fac.3
        for <sophgo@lists.linux.dev>; Mon, 25 Aug 2025 18:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756170601; x=1756775401; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fr502dmQ4odPuahV9+jfQPzgPn5kXy7yEDTTv9ShcH0=;
        b=H1Wv8YcupBCVqlJoxz3VAGyxbUqoVNbPdZs7eg88lP2yJiKDbHCihoVhhH9A0crNsj
         e0hQ51MQFSZglajMX5OGryHCCYE2rIV1rzBflQzUhu1qHt2GD6f2w6oFczMxdPOPkC9b
         fmHbicWuml99UWFf6/hGb70VKsVJsvPpJEYYtnW8b/iK/uxO7xxIZA/SSMeu63JdCkmV
         bDDncmis32JYq4Woi0p3FGxGzMo1SzlFiaVTiOuAyNJTXm65XPm/AJEbkjcUDS5/nhRO
         rRsjE1SDbHzz049BxTev9nEquIW8LttvEE10/xl2jxB/lAaBPGBNJOUXFx50cB87X4ff
         2wEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756170601; x=1756775401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fr502dmQ4odPuahV9+jfQPzgPn5kXy7yEDTTv9ShcH0=;
        b=IK4jxeoQ8H9Z8Okv8lbzZYdv0PPtY+kl6YGVsS+xp3TtMvrSaeyGkR7DGdEAlEP8G/
         LYvxku34xQz7PjRGUpq7gGW42cSe3Q4x/+JvJNpF00Rjr7G/WYBgCMMEbRh5iITV/sSc
         xiZt5cj98yHIkgoHil4HqV/VCTKU6VA+cZXnWLDP5iUIuKTe25RnsrVEC61306lod23Q
         8dMzwQ77GObzWcSv1J9xegMxrWEdjlIjIN8zgAsvDMKQQvdTJphYALBhbiVzufRnyvLk
         KZ3hYYwXmAfMSveW0JTLzy3p3hhC0+4XFQHIAjpMvRoIQwEK47sw7xeMfnL9YszYP5IM
         mrIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrf7plnCl3yjdq71Tyskx4W/1Gx/NzjzKdjCjD47aCi9tQ8XCeWNbS0nC15A6a19u4gjyohUI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPq5DekGACMnCTPBGCoBwN4+GlA2ABYSXPR9CZAX8jIvCCee4t
	9DFIapjt6QWTq8Qhp3Hg75oqgFk8nxfhKm77kl7b9ORROW900giaEwr/
X-Gm-Gg: ASbGncvVsV7QmneEytVvMtc9TBKkdJpSXeS+MxxWvYsdxlaT8cGwG3rzWJtmI5fVE/K
	iWTgWiO1GGRosY332jCYFGbxT2rp0s3AG07zl3KT6r6Tll86u7nXDYqI3ypmX849b1gV3fGIrE+
	RvVHOhEVwl79gxlXdtcfPwYD4JXfDh8xo63MoqYMgc7UI7K6oZ5g6zDCpRxHkm3Od1xz5pyO0k+
	BgoVU7ocNUL5Fmf4Sgwvy5OtCoA+qWMFRh68trqWTGie1pGIdFih5dn0Vb6tFpTg5zGqP/tMWBp
	OmNJQlSzbiW/rXOVwR+EkN5t4WTTR5iq06P2vcEt4JUkqjT+F1vnQGYMOgYkOpuYqIX1rPP5rke
	XAwts45xN59jH1lm7B3ucnCHjnQ8hpLPR
X-Google-Smtp-Source: AGHT+IEsQEcjW1z7CYizlWk5Kdag1/FnHr2VMtUprwv0c3Uuh19bv5SQ7f4+YOhBfQookgotMBtBBA==
X-Received: by 2002:a05:6870:35ce:b0:30b:b7e1:b3fc with SMTP id 586e51a60fabf-314dcda8715mr6397465fac.37.1756170600590;
        Mon, 25 Aug 2025 18:10:00 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-314f7dd474fsm2181363fac.34.2025.08.25.18.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 18:09:59 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	inochiama@gmail.com,
	krzk+dt@kernel.org,
	looong.bin@gmail.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: [PATCH v2 2/3] riscv: sophgo: dts: sg2042: change msi irq type to IRQ_TYPE_EDGE_RISING
Date: Tue, 26 Aug 2025 09:09:52 +0800
Message-Id: <edafa432c80a328d80952fd40753d1c8cdd5364e.1756169460.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756169460.git.unicorn_wang@outlook.com>
References: <cover.1756169460.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

The latest MSI driver will read the DTS configuration to set the IRQ type,
so correct the IRQ type in the DTS to the correct value.

This field in the DTS was not used before.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index b3e4d3c18fdc..6430c6e25c00 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -190,7 +190,7 @@ msi: msi-controller@7030010304 {
 			reg-names = "clr", "doorbell";
 			msi-controller;
 			#msi-cells = <0>;
-			msi-ranges = <&intc 64 IRQ_TYPE_LEVEL_HIGH 32>;
+			msi-ranges = <&intc 64 IRQ_TYPE_EDGE_RISING 32>;
 		};
 
 		rpgate: clock-controller@7030010368 {
-- 
2.34.1

