Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79891607AC
	for <sophgo@lists.linux.dev>; Thu,  3 Jul 2025 02:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751508991; cv=none; b=tmUDdtIF+26kiHXFCONvM3yVguOmAJzvh88ckitXRsk3Fc/DAm031I8OUzOpm40WYRVReP1Cow90cZogmrYcdpO0ehREHr2qz40WsKyZF9lPspQEDOupLRhO+WlY4U8tLfis0qm3UNm7BmHi5L3DjY9F3pRATUWqQ8tJqnmxCi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751508991; c=relaxed/simple;
	bh=Hq80mkzOm4sDH1lo61LQlZ+WhvZpGs/2+0D69YVEncc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YlYIyvMr9B8W4u6okIW5mG/+AprTpqlH3lZTmcO3owvtCjd2Zzl9EEv9SLmIGuDrhPvtPJ77YXY04Yuoair8XOC0l6Ks2/C+9se2ofUpJvs1zslO3JOPbwfvR+0Lc7byWyEXDdMf/qC3LNxERqlq6f3tHbpwGPjSPOWV/fLauoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fGSpLifd; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGSpLifd"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-74b56b1d301so802797b3a.1
        for <sophgo@lists.linux.dev>; Wed, 02 Jul 2025 19:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751508990; x=1752113790; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnJ5HyRFTLzSb90lPZ0kytxtuJ4Ps5kIpRokWvdn6qw=;
        b=fGSpLifdJvdnjFVZwdILLyUaBMN7OfBV6WuyD4mjTmBhkWEKUTS19vuDUwX58l/TZB
         1Cj1hPvzKjb0wxOQCctuRUDqKiLXOdF8+Gb296LSXR4Qr334XkIBNjoCeL+0+93qJU3F
         MGw1P1bPys/qSfZLGjzavePzAEfJ0n6U+ej1HeeUgF53xHUTgnTzBbWgnnFbL1C+OWWx
         7nJTTKhZLxuevko6g8NBUqRbRtpInq6LfkNYjFO88h9VeYxKWTYLpLH2Dya5d4fMZ1dM
         pv/Ah04oD0Wiydjcpdu8oHQJQoSKrY6GuBInSQIzea9MKZbeWY34iWJPNOSNscjaFY8m
         Pd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751508990; x=1752113790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RnJ5HyRFTLzSb90lPZ0kytxtuJ4Ps5kIpRokWvdn6qw=;
        b=MunPVOuahEd69ZhJwhbZVP9LkSXsEIz7uBfcoDriGzWuMEX2OVQLlZOZQnW68Hww84
         q77EE5vMjLcvlS8uKdC1TTuCnDvrOQPxpjoIPeuXqWBKCnd6WvCc3DN1U1AGulhjQRgW
         IlbpxOH0yAq9wS/YqEauLZTVKbLzfeNkhVCaQvDMQgyisisXyy9FUWWEQJanlv7x/U+m
         PTcl0T6emdadmRaUbvyyBxMQQ8MbfXjLz889khYVnRp3zL4bk9uELAKfsSfcXnXx0Xy0
         Rv7DFVLP4PxfueBodI8mLtWRaG8eeK/mGjkO0G6VjgwUUBiDb209WSGeW61lcKRwndco
         VgBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlK8bsR9rcMmBdGZELrvOwbQn60IuR7j99CayonwAiSaYOnWKkjqYhwcIctMKugfYFQDKJJ5Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx2s1+h5zX5YBvL81idgYDjTSlAC9sBOq9Xdd2ACLYvPCCR5rb
	9ZOBoyozfc8FhSOTru6i4Sk0D5U1RkcSNLs4betfv+ohAnFYke5lKO4d
X-Gm-Gg: ASbGncuPhNalbKh7gLBhIuN/R55mRH9zCEO4SsceoiI4mqEPpvumfDu4yYVfqKfIiaL
	Ac5AWWaduM9nNefJ7JnWf9Xx8l4YpnK7unLh/UYX9ugerxT8fH2d38rX0u3AxZvUIMM8MxTlmCn
	qNKwt8S/Ie83A4IRBXMJhsVXjbzvGxdc5hCm3xkiMpyWk4KOgGU+n5qHYebdgQo1xYYQFw9JU0z
	qmGfXe40pYMNbLoiExvcwchwijTlfdSpfr9PP7/4b6sj26u4WGxxLCdAamvdDlohulFIRA2f6li
	9X2ekUU99Ag+eLj8ncWd964kamKFgunjzCoB2nyurkKL1iGNfy3xc0XR3dAtgOGU/wieRaay
X-Google-Smtp-Source: AGHT+IEpMsMQUhVEgvoZKgFsN3ulChI2nMRJELvAlPxYIYdKpwZvdxW8bpYzVJB4RTLdgFWxGCsHMQ==
X-Received: by 2002:aa7:88cf:0:b0:749:1d18:2c74 with SMTP id d2e1a72fcca58-74b50dfa0c2mr6495116b3a.10.1751508989779;
        Wed, 02 Jul 2025 19:16:29 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74af54099ecsm15228303b3a.11.2025.07.02.19.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 19:16:29 -0700 (PDT)
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
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 3/3] riscv: dts: sophgo: Enable ethernet device for Huashan Pi
Date: Thu,  3 Jul 2025 10:15:58 +0800
Message-ID: <20250703021600.125550-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703021600.125550-1-inochiama@gmail.com>
References: <20250703021600.125550-1-inochiama@gmail.com>
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

