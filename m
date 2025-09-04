Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943221DF261
	for <sophgo@lists.linux.dev>; Thu,  4 Sep 2025 03:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756954872; cv=none; b=Vk/stgCL+Fl9gM2Pjj/JeNF9v0kQzftU4hkLZX7zWD3ujLPz4cEGIz7leLaxCg3l3Sj4QGusFLbdBftpANqaI1dP5wo5CCr9m85O4iEuybfwVMDxguo7/+ZpHgSrLLmp97cLnehg5kxERMfpwhYevAKctI5sMwVvPXR0eszxDyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756954872; c=relaxed/simple;
	bh=7TEQbJVJBXCCiacnB/Yp9DMsG1Vgkh81p75bgBk/TWM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d27vx5U2etxxenT2qWhOqetY1rs+XfvPBLuZQTaBCHESw92rkwbRd7hjK5nmHncco1YZlkjWIdLgJRY+gado0Qvn0h/vS5ftRR5e4XHrEik5p0+8E9KbFEJO7W707Q0o1Y/Mp93rbyQd95ScLJIjdiWUQTf5KO1nJ9/ANs0DBH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gT6odpGY; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gT6odpGY"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-315a297f9a3so475350fac.3
        for <sophgo@lists.linux.dev>; Wed, 03 Sep 2025 20:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756954869; x=1757559669; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHYoZy1BbbBb9vcfhdtPl15TFAqdbk6Ii/kfuxxPco0=;
        b=gT6odpGYpVoNePUJZJx2rQXBf3dEm5JHfV3d58zOjsVcV4QRtRpU9MzCdT0jTfpcVK
         kgxG4IaO3Q0gfE7Q0QPzb3s8hrxmxZihw4zvbBT6Amtt5vBdYCCzClTi4MRThsQaW+UJ
         hFuwBDWgj1Qog7FAc8CreJmfFmrQFka3ZLCkBFZUaPO2ktCc72JomIwYI7mv9dyr7Z8f
         UT6w8q/m9ps18z6W0tKUS4jmsF8A7AtMPk65BWBZubjFKo1KQ5IYWY/GPNvVZPgM0LXH
         JTn/LLzHGwgWcZQ2653vym9DPcvAkZhKqEur8pPNkQs8aQ5+eDPtamj2HorwhM5aaDI6
         OGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756954869; x=1757559669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHYoZy1BbbBb9vcfhdtPl15TFAqdbk6Ii/kfuxxPco0=;
        b=IWeyBeUcA9kDseS5iLOdZ0zA9Bh5l2s9+S2KU5EzkAm7FNB6zBE/hvcim1sWwhVh8i
         MTkZV0AARuljtbsf3gm+tEYyoVhirOGsWghLWqxxtI0GRG5evTv+xk3Bypkr9oQr4F14
         yuJ7uqwrZSZA7KP4ZP/t6NxpY15no/K64+C/ifqcPHetJ3Jov47pReZftry66aMs2fmw
         5T7FjQMyAv79XKRdH/J9R7rDO/NMPJ2L6MavokdSsklgvVS+aArvevBN/MFPp80g5CWS
         Cp5O+5stvj3YI/G+orTZMky+q10V+tew3ieTXIfzDH/e6OwomF0RWLtbAWPrubKg/FYa
         6XuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeUAjhNuCj4toBphDKzErAMZbTIY5XgLs9+ZOgNkmPqqquw6n8r7NIwH8yJA6ITqxV/Y2p1gA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHKQZU9w6KEOrWL3ixM0BsZyS+YxFCGEJjyh82aTRa59E7pcMQ
	eqVh2lr2IE2Wyg6+pYfNwkJALEQ8AgHjPQgjVQVexswbWZl/PLazHUqK
X-Gm-Gg: ASbGncu0ubYc1MYdfPXEVEzxeavt2gyBc3gv5/qZjFJelVOLgyHQAv/AyQPg69YHyUW
	Js7XJi8xgXh/61gIEN4/BdkkAe5xOIvMKvOAMxnoulXuAoOkFhapnVFd2qt337YP0hswNw1IpPd
	DEPAg+aTe/vAsrdF90ejz6OcsXVyp/tWQ4IqKW5Bbs3V8w0R/KqVjhlqkV56s4LYM3LOn1Gog1p
	ODoSU1nIOVrBwuGil86a9o5NOlF4SuXVepVn32tWPIo/JRCvV4wTGInfpSXLcvxvH2N3zL0Cq+K
	Hg0mbMufj18m5WsJbJHLEULIyMv81/Xdut6rjWlh3V/s7FHEyPgPFCtNTg0qZkTacLMI1x8e3v8
	/R3igUVWyQ3/tmRb6DOJ6DdtNnX2GUAAl
X-Google-Smtp-Source: AGHT+IEeO2nVtWYZaHo8wP52NN3KXbpMpsy1+TD/jG7mcZ7sL45J2EgJViHSBD5Zz1bzVMdn3YTMAw==
X-Received: by 2002:a05:6870:a90f:b0:315:9e4e:4f7f with SMTP id 586e51a60fabf-3196307efbbmr10158685fac.4.1756954869501;
        Wed, 03 Sep 2025 20:01:09 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-319c704f44csm1327722fac.2.2025.09.03.20.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 20:01:08 -0700 (PDT)
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
Subject: [PATCH v3 2/3] riscv: sophgo: dts: sg2044: change msi irq type to IRQ_TYPE_EDGE_RISING
Date: Thu,  4 Sep 2025 11:00:59 +0800
Message-Id: <c38b9b1682af978473705b7e70b6faaa36fe5024.1756953919.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756953919.git.unicorn_wang@outlook.com>
References: <cover.1756953919.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

Fixed msi irq type to be the correct type, although this
field is not used.

Tested-by: Inochi Amaoto <inochiama@gmail.com> # Sophgo SRD3-10
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2044.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index 6ec955744b0c..320c4d1d08e6 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -214,7 +214,7 @@ msi: msi-controller@6d50000000 {
 			reg-names = "clr", "doorbell";
 			#msi-cells = <0>;
 			msi-controller;
-			msi-ranges = <&intc 352 IRQ_TYPE_LEVEL_HIGH 512>;
+			msi-ranges = <&intc 352 IRQ_TYPE_EDGE_RISING 512>;
 			status = "disabled";
 		};
 
-- 
2.34.1

