Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428B2221F31
	for <sophgo@lists.linux.dev>; Tue,  8 Jul 2025 06:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751956875; cv=none; b=YC2o1KqCVDDFFOJkBHW4HuV78n3PJBMzUAwK6oSJvZyPI0jwsKIKL1Q6tUZRHQosNjPeaOTV6Z63xZac6Ag9W+e00q05458q1oz6rlQRrdBtMSveiSS54GrpZYUimQreakEWtBV/XWAKEq5/IIq/0ZrWaKUlZxNhVgWIxwok6po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751956875; c=relaxed/simple;
	bh=/sRu8XgOB223jLFD3unbjdJLgthr0CulTEGpn5wRRFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GBYrO7G9gynhap8xnjoKp1sbXwvKkPUrv5Ic8SpReCQQGU3BvEeNa0mP6E7mGNXR1Ay/aLKwmRyyM08k7U5boGftuRP3WP2YeX0FUjLtArPwFVHmDb7/6JUUN/aVlF1RWuqqSL0uaiRlC5v5fEUm7eVV+f7q55TDlyBNxAp5oIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MH1ozB2e; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MH1ozB2e"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-af6a315b491so3536803a12.1
        for <sophgo@lists.linux.dev>; Mon, 07 Jul 2025 23:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751956873; x=1752561673; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8NWQCR/vjjoocQDKQ3G4Y+84Q55VY5nfXeYI6Rtw6A=;
        b=MH1ozB2eQhlnL4K4/Yj7xWH6Bb+Dy2cgJQW40diUo4qsZD1OwovH+6qy+WWFdEqMm7
         CCzUqsTBfV7wxmB2JsBxV9DrKXRSujzHuKNagb7omH2DUjPN/FjXqwiPjiV1K6M/uujV
         iFtLvigba7yEOPExyphXm+GmcvfJVKSCPgoDu944nenLjhjjlLc2tC5FRstYsKK9pqP9
         MhxQ+JXgPvUxC3PSnZplI1UiZJxmdkZhVQ8QOeStZB5te+DewY91Qc8UnxKm1FAAv6Wo
         aYhpiahu9SA1AvRCtFa2XVWGDGRgx0uu2I/2ybyxC2Li4eWnPr5C2JMoUM7+vbQIp7wm
         0S3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751956873; x=1752561673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g8NWQCR/vjjoocQDKQ3G4Y+84Q55VY5nfXeYI6Rtw6A=;
        b=UU4ZJJZ3FuOEdQIDH66JjeRadUtja1UwvPJ1f9FPxrtR2bDfeVnWd0WFPT/A3FHuBJ
         SJ54SVx7PJBOrNEfxSGkp0K5QLEWRyJ2nZEOTt8ycKEIe+55NcqkRA8agIaZH8h4+eEB
         ojUyQePkt6IFjxvIhcT4f8HSdwjoVWfHnTjTS13vIoyYSSy1qlwfSnWAA41tu5PTKXG6
         lUClRlCI7gf5qGnlLPBMXa0PBLsFfrUlpt/aYkqVHNwZp6jD+U3uewjgmia+i54Qq97f
         S83xy4SWphFLXY5DU5BCqrHdAVMBC+o4AOITCw/Gt7bWNbeo+AtLdOIMdloA/pU4Jzyo
         VJ/g==
X-Forwarded-Encrypted: i=1; AJvYcCVYXOJz4ihp/553zm0RrOzmffWOa+porQd3bTE/P3BtaClsJP0K75MSj7dxvwQ/9KUJ8/vEX3w=@lists.linux.dev
X-Gm-Message-State: AOJu0YyudImUhWpZuiFMFAKTgBiV3RVuR/ID/on4jIQRBV3TLMIAEKLd
	sPVzytCFQJAV/0EAXaNTW8Kx0454/QjJzRh3AIJwxl7AioGenVsZRSZW
X-Gm-Gg: ASbGnctwyTTLl2LiwrAgGV8aA1VM0efGdhSTyfwXhm+YlVv2f7gdYaKHld2luyb/96y
	0JJAFkmJrMu5UXOMsv+OAtDuTPmozbJhGo408huJUxiZlF8YxS2iOti6BfCnuemVNaGYj3YglDf
	6LyTHxSvb4ES68o9+HejMVA6C4lUOC5cer5p1/YCadjFczmbHGLrv1uSi72Q48V1gVOTE4+wQKr
	OTojHKzJ6mDf7cey5Y9ZoOS6fKTvwuL05I9e1KQ+rtXA+GUTBbF1HUrNvFnLtG/7mW47aMYNVVp
	kH9RR8Vg8ttIT8Y+h3Hcu6MLz/O3/pp4KrJ/BF1kztPM/+4eLHNQwMuViIkZXg==
X-Google-Smtp-Source: AGHT+IGi3okrZezMQqZWaDno0rnyTSGvjOHwFQZN6i9UVU/ZSCdmvAAsyqq8FHCig1FFJj0ZJIxfOg==
X-Received: by 2002:a17:90b:1c0a:b0:30e:3718:e9d with SMTP id 98e67ed59e1d1-31aac552db1mr23882560a91.35.1751956873397;
        Mon, 07 Jul 2025 23:41:13 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-31c22055c99sm1328425a91.9.2025.07.07.23.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 23:41:13 -0700 (PDT)
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
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Subject: [PATCH net-next v2 3/3] net: stmmac: platform: Add snps,dwmac-5.00a IP compatible string
Date: Tue,  8 Jul 2025 14:40:51 +0800
Message-ID: <20250708064052.507094-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708064052.507094-1-inochiama@gmail.com>
References: <20250708064052.507094-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "snps,dwmac-5.30a" compatible string for 5.00a version that
can avoid to define some platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index b80c1efdb323..399d328b3b11 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -410,6 +410,7 @@ static const char * const stmmac_gmac4_compats[] = {
 	"snps,dwmac-4.00",
 	"snps,dwmac-4.10a",
 	"snps,dwmac-4.20a",
+	"snps,dwmac-5.00a",
 	"snps,dwmac-5.10a",
 	"snps,dwmac-5.20",
 	"snps,dwmac-5.30a",
-- 
2.50.0

