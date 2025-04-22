Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D65C1DE3C3
	for <sophgo@lists.linux.dev>; Tue, 22 Apr 2025 02:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745288854; cv=none; b=lT4GXiniy14+4KvGcZZKTgXPEWxt03+l7u7D/7ATWi6p9RtUnRuiIyyajnQMg57chMBUpjvpXO+xp4Iv0rtb+RGSNWrfuGFoBgDm3miouWwsiVungC/kLwSD2bMWbCJToT0yNH1qcu81gG7k/Iz4wPnAgVTxMlWrB/4tHD1LA0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745288854; c=relaxed/simple;
	bh=ganoDYBx8hQBUMjZZ/y0o4Inc1qW5ojnaGmIwzuabG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=doFPbwcPX4gYtRGIH2vp6Hpt/E9yd0Va55JB/GwTG0+CnqBGaTBFWplulfKIUGchzismDaR0tSVxtoBhDIHKqS353IfJT1mt4bf1E/0C2THDFx+woV/sG8ReI+qUEGbzEhbXUrX1NtTh1NSOF4X3DFLJiNzWDwUFUpuoxrbWtOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hA/TrUJt; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hA/TrUJt"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-227a8cdd241so51841125ad.3
        for <sophgo@lists.linux.dev>; Mon, 21 Apr 2025 19:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745288852; x=1745893652; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmODs/cciVwnwfJ66cvNDc8q3VvAdEuctjXNgr1Nt0E=;
        b=hA/TrUJtA560qaz2+qNTTzgh2MqG1pNI79h1YTRhkL5R/vW3H7ePNNOQnICxB7hgPH
         zUBXKlCkU87BnehR4l+z4u3algCpqkZWONw6QKxjUe3KqTvRmFb8EB6peiLFIN3Gq0x2
         q4FFSoMPwfhSZFHgbX121oXKgH1DxyYWIR+U7C5UkmNX4LsBuPoJDV7AdHmcrpX9X8kT
         4OxYKmaNuqKhwy3ViIaIRD+0hYomgqXbaShAoEOjR72ZZPrp9+Iu1ASW5V11fF9QkML6
         nW8f7Ey/f38AG1bvRJISUZxRP0G0+Dv1h8PjmahPLWsCFeDaZXttgzizB1HNwGT43kFs
         tpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745288852; x=1745893652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmODs/cciVwnwfJ66cvNDc8q3VvAdEuctjXNgr1Nt0E=;
        b=odVbJ4sV5WeFsebbxk0+d/bmZBDlE2rhyF7A7gLz4GoivAkVZTckcFgaZ+FzuBDyZr
         qljzTrqwjJl/9PPJOZWH4zoFGp+wskywqY3nCBThh/rINNFY7pbakz3CpPiSqQx1pshM
         KVaSNbytKhO4BTEXWWd2rMqlqXAoQ20f1e0SKs341b/JX5+j1RXcgEHX4aQpRBwafgNy
         oJJ/s6/oWiohKvCRZj1kA/SIH3wX37N7vzctmZFneBuE641Keb3NZifPtL0eCVqoc4Mh
         chySf3NGKUyykwhUZHq2BPFsst+sXRzKqh2XvctlGA+IJzrpSoN1Hi2kmDMa5eSgdJOO
         Wucw==
X-Forwarded-Encrypted: i=1; AJvYcCW/GM0TbPq50WMv1do7kVWwOzDyitdXzDxiwtVvCWxrMAmxRPvYSh1hrENuwFVAjbt+iH0O/h4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoXt2XiG81gWFzzcoqjaFfZdby7sadvGgY1bAjtYXGl9SoraNX
	3KAcyHz13UdN6OuViB2YJXM0pyXkrE1DdDM5a0xk5SzoJng7sT7W
X-Gm-Gg: ASbGncv7QCp+g47Bw8yYXGDqDAABWJRbl7IUPpgcjwn+zrs95WnakBM3jK338VZQBkO
	pgaq7WXOt/CX0fTDmcppdg43V+vspsHLawkyKkpPQ+r7R25jFeNBSDA0ZbTfHDKL6KZGMdR3MRY
	aBoCZACaquHuMgWthSXyHn4aH5+RX13Ah2F0Jbuz++2/GzyEyLv3tbqVV9jQS3U3lvA1SNstRzk
	nL9SgjgKSYKDOXxRJfRrtm9tgfegPLgIpbUdqumWLBGug1hOyqrH1r9Ul9HHBU6HZg4tio9hFb2
	h1bMVtC6JoNLvRy6bphW1xJvCvZE2yGB/VzX0BZResJlaJXh
X-Google-Smtp-Source: AGHT+IGLEGWEeVyPyDR+wwWTFbq0oVcv8eF2ibjbH3ViryHv62o1TunCfyCqdUOPhJP1VvOrf1DOig==
X-Received: by 2002:a17:902:ea02:b0:224:c76:5e57 with SMTP id d9443c01a7336-22c53619897mr185730775ad.39.1745288851578;
        Mon, 21 Apr 2025 19:27:31 -0700 (PDT)
Received: from [127.0.0.1] ([101.76.241.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4ae9sm72962905ad.110.2025.04.21.19.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 19:27:31 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Tue, 22 Apr 2025 10:27:09 +0800
Subject: [PATCH v5 2/3] spi: dt-bindings: snps,dw-apb-ssi: Add compatible
 for SOPHGO SG2042 SoC
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-sfg-spi-v5-2-c7f6554a94a0@gmail.com>
References: <20250422-sfg-spi-v5-0-c7f6554a94a0@gmail.com>
In-Reply-To: <20250422-sfg-spi-v5-0-c7f6554a94a0@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Mark Brown <broonie@kernel.org>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 sophgo@lists.linux.dev, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, 
 dlan@gentoo.org, linux-renesas-soc@vger.kernel.org, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745288836; l=1083;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=ganoDYBx8hQBUMjZZ/y0o4Inc1qW5ojnaGmIwzuabG4=;
 b=ipoA2Z8SVi5C+lrmIzQZEsdCe2VqC+YO7vejgCp0oqomBR+RosewWbUQDu9EyO5R73jjrQsnV
 ScUl6G8cP6eAca4dFz1Mq+0GcLEcRFNBG3vhZcGbnNpxNXGog9Dcj/D
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

Sophgo SG2042 ships an SPI controller [1] compatible with the Synopsys
DW-SPI IP. Add SoC-specific compatible string and use the generic one
as fallback.

Link: https://github.com/sophgo/sophgo-doc/blob/main/SG2042/TRM/source/SPI.rst [1]

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
index a43d2fb9942d85b1482a52782c0a97cd5c6edd99..d32380a2e5b18f61ed66715b4ac67c04fbda10ef 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -67,6 +67,7 @@ properties:
               - mscc,jaguar2-spi
               - renesas,rzn1-spi
               - thead,th1520-spi
+              - sophgo,sg2042-spi
           - const: snps,dw-apb-ssi
       - description: Intel Keem Bay SPI Controller
         const: intel,keembay-ssi

-- 
2.49.0

