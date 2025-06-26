Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F45F260574
	for <sophgo@lists.linux.dev>; Thu, 26 Jun 2025 08:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750924884; cv=none; b=nVWEOF0ksSBtRvoZq70rOlmc2pjovUE4Qnex7G8REKfAsvqn9U0zYHJuDo6vpjquTZ5mQT7OzOhWMkQU8QqO2dC/hgSDoV5+Xt16dTVqnDrzWu1+NiDJ8okE9q4KWzIY3535uEyLHUP/c0LHG0ssDi8DeGvecVbPYJjwH26ND5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750924884; c=relaxed/simple;
	bh=Hq80mkzOm4sDH1lo61LQlZ+WhvZpGs/2+0D69YVEncc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ro3R6v39sIF+IX5QCwlStOc/SfkzJ/DeLdl9IxAbA3KttzWraa9OQFWqM1nbRcbt/pB1tlPKnM3tsUoJPekvdKUoiI5nA+ZnRAmUhLgxYJyZrGWOprYEUZqAHiKqXvZMRBVikABfsh4v/T7ix6iYcmBENXapL5P1K09srLJog4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDSBABuD; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDSBABuD"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-236470b2dceso8346555ad.0
        for <sophgo@lists.linux.dev>; Thu, 26 Jun 2025 01:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750924883; x=1751529683; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnJ5HyRFTLzSb90lPZ0kytxtuJ4Ps5kIpRokWvdn6qw=;
        b=lDSBABuD9yXKtF6zWMMkLmOmGVnNI66EPsZntFgcWhk5aqKGcZbVKm92dPhU+Cht1W
         LVl6FiPuohaJ3/cJcZlanncdGy5T4UZ1bsd9qh5BlcIz/LMOAJSrNi5d65ulwPGL5zlV
         nhb5iHH4OE0nZXsScoO4RgSbHrlae60juMh9OJlRU0FB77vOLTwEJAVEnPiJ958jH9Ne
         5i0/U9nCsNS0GLQpOR4F0Ke+O8M5luOCtCVXu4SWndzvUwUsN99WTfdrROJReVwdYkF1
         JS/lD+yEPhJbVXBforcsVI61kzqE4mmR0Ra+bVYxOns33ZtHv7+DUXqyCC+T61B8Tj3s
         GmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750924883; x=1751529683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RnJ5HyRFTLzSb90lPZ0kytxtuJ4Ps5kIpRokWvdn6qw=;
        b=ADWH+x6zgHTwY0IvQwQ7PH163NzsujUcUXLjTFHwzCrJHsc8Vl1meeF7nFc2SQM0Ch
         wg8O+WKn+R98jtXgo4mH4zoinbr3tsi7W8rkIZCQtTwGDUkKjZy3R/3A7S8TdsmMn1dj
         cw71gCa8Nqq6Y7t4nyGfZ5WKNHJVGBderQHazcuy5uy1X1OwLzqVPfVnfqjkSh2tjlUd
         OiO0LHJnoG58P4Q1JvZznndr5Zy0r5K0cX3QIb1NqrEVS1qtMxG4XSMzE4AFcwYYp8Zy
         j4pOXNwgbjgU53gyc+6Z9h9SQNWkhpHmpQJNM9VTRrrVXCsw5setoTxfSkbOcr2o2XQ4
         ekZw==
X-Forwarded-Encrypted: i=1; AJvYcCV/adYabiqymRSYZPaBhgIpnFyPXimYXFDVwvmt5v09JbndtgaKbzWy9H3ROImwM/yV3hvUNc4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxsbC8xkxvLuBhvoUFXVSFLGO0fHOYT0DYeHHS0E+AVCKxYKdds
	4LkwSyBh1+MzJ39aqQmHWn26BiFcyHy5PhRK3kPzPaLgcHYDZMdboh5I
X-Gm-Gg: ASbGnctct7C34q1HIIk8vtnYuLCxqCV2gZi7BP4HsJHSzCUGyXEZuxGJbXWnv6A+18V
	RewVmearPk8tzreKHcPBfTXwuSij0IZtaoksAZbPgVoxvP2RivxoS69utMOHVbl8lZdqENcNEbN
	UC8mE9jiRFH+/8CpWXo/OqqXq3vD8Dvt0WWvgEZBDioGJVFftZ/HrNZ/aypKGJ7rka7BweKJm2+
	zTLrteKEuqZWui7yG0AvUHJ+CQvQl5+l/FMzf+DwlKBeyeYSWVUoq0s13BTvXzfu25lTUECs2Ce
	uc7nCDSzIz/C8iNYRtjDeNj8Ui5ugZED4wDiu3Y4NMDyFaZGtBC5fkXgFntckg==
X-Google-Smtp-Source: AGHT+IHEcN9TqXpZqCIhiJkeXd5Rd4ZpIJF9ZCmoYkubJ2AJSnfavgHhpNIHpdPsx+RjCvP+UqGFrw==
X-Received: by 2002:a17:902:e947:b0:235:7c6:ebdb with SMTP id d9443c01a7336-23823f88824mr119070055ad.10.1750924882766;
        Thu, 26 Jun 2025 01:01:22 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-237d8695195sm156236865ad.187.2025.06.26.01.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 01:01:22 -0700 (PDT)
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
	Ze Huang <huangze@whut.edu.cn>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC v3 4/4] riscv: dts: sophgo: Enable ethernet device for Huashan Pi
Date: Thu, 26 Jun 2025 16:00:54 +0800
Message-ID: <20250626080056.325496-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250626080056.325496-1-inochiama@gmail.com>
References: <20250626080056.325496-1-inochiama@gmail.com>
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

