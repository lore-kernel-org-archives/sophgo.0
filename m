Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0658E156C69
	for <sophgo@lists.linux.dev>; Fri, 25 Apr 2025 02:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745548131; cv=none; b=hLypiXSwuY2kEVto4wgLs/GunJE8U8uPgtX68CnYKabdJrDkvMu8mE58Yjg7WCRYybZawZaYxdykemV12imVEyHmI16OiptTDnF4BWhZJU/FG7KSCiq8EdmF4z5UTQzDJxldCq00/5wWwgViZ/0HfduNmP+tCsJDfOe+goejHnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745548131; c=relaxed/simple;
	bh=ZmdPpnOZ86WV8AspiWmmzZXwyUoSGbTCqeZlZB1Dz/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kr7fdcWSucjw8e876MI9zcrXnJ56Vd5AXUDB4gsf48aYadbLiqXFXYTNUDW3plliTrYdhEYQCtTor7NQz+g04JrePcgSPMg+JAgmrl1sjrtiPYB1GV7fNEqZqRosumJr+w5C5bYH2ljLCODmTQukIW+mrNPBSAIfwiYkWttnLqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4OTCHrJ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4OTCHrJ"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb3so1886007a91.1
        for <sophgo@lists.linux.dev>; Thu, 24 Apr 2025 19:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745548129; x=1746152929; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hpF1QYIR1QzmtFMnUvu7JqtGDUe3J84yW7wA0AOB8M=;
        b=h4OTCHrJUaXWDQWK8MGpj7o/3Z6uZthgsx/oShDEzQiiYSgQTUVtcrTWaGRpn6y/Qa
         44NhaaU7UWRH1J1bssbqbG40S08qT75E2rtrLl8vgd6go+QkD3vt+t4/My6gf7nqFhv6
         1EJRw5pwHp1CEKfekuqiSPX4cFp6WPG1yx1bS/hbzgkA0eG0bBEm8BcS6dPz/hZzdsw6
         EOOZeCSdQb1SkEEIcfDE6g5V7OeG5UUsImUyL0o97q+3J/Vi0Bjvtw+h68x4EQOAofk4
         ahEN2+199VAdeZhNzAQ8qKh+I8C9ahf5kbKvNzYlNHribyyN26OkGgsDjNMQqk8denM6
         YyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745548129; x=1746152929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9hpF1QYIR1QzmtFMnUvu7JqtGDUe3J84yW7wA0AOB8M=;
        b=AX4mMVAuZWtwUSsT27uq93mEDnTStElRmja1Z2G4U84DqVCbklRs1TKrfziKIlIZ0d
         7pP5doW/2CklwUTq6/ntYjtGAUAoUtu29+p/AiSGTXZClbLs3ZlkJTVbkbCdJl6je9uz
         NDPlDXIuoXeOtd1hk7+Vj5b3RCAhFsZiQLQ8CDqKsZ0ZJ5IZmR/8pvzOajTAYhiyMmpR
         pU6B962NM3QRF62hP3UZT/O6XqHXFL8TQ4n9Du+L1GYRJgrRsrzED9zdpIwA3IJO+ops
         laXen6h8ainR27yLZA4uBHHgOtC3NnF+tJ551QjIipAEg3hfOtbxysetV8qVOTb3R9Jy
         l+TA==
X-Forwarded-Encrypted: i=1; AJvYcCWYAzVPOYG8BQCcrvCu2T0GTIsi0vj5hnaiuPoM0k4qs1BMKT5xTpVQVKAVbFj3hZPIV5iqUgw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx45ES4SxcLwZLN7eJ6Ksv/OwaVSjY6mzvkXG33BsCBhoeW/wDH
	D0MMnUNc669GX+s0B6/6dFfIQg6Ne0mhibT9bk9EGbprwubwf5bS
X-Gm-Gg: ASbGnctkj3Bo0bijHbR0B3p6nJk0qxGIpQ4kAnk0xT6/X/1ziKZWUIDKX1RISjW+ZJ0
	41U5hf4+SfEkv0IV+FWgy1s4FYqQn7UgDXWLK6HwuaWpxWh5mkn8PzeAV3cs+u5i0oMLnoqIMyN
	9VU0h6ZoOZ250MIP8LYjSm3heckUjuI9ZmProtkDaIYb5fRQF6s9yibKRQ8KQs7pwoCj/R51CpS
	DYv9gNeH8U20J6Mqh3qBPoNnA8pvY1j+IxpMTdF3fV4Ah6aLmFkxRWEU4ULVcS6VUl4DsZjQTVH
	wF5QDyzvYxiT2nnBsrfi2L6nU+2Nv3wBaYakhwAD+Iox0Q==
X-Google-Smtp-Source: AGHT+IHhVh8/syiqQVm+l1KSae9zd6leTCYEp4C8rAUy2J15yHjmcGB7QJ+GZArGfhW+Imf3+BiCzQ==
X-Received: by 2002:a17:90b:2545:b0:2ff:6608:78cd with SMTP id 98e67ed59e1d1-309f7ddfec7mr1289140a91.9.1745548128840;
        Thu, 24 Apr 2025 19:28:48 -0700 (PDT)
Received: from [127.0.0.1] ([223.80.110.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f782d4a9sm365455a91.30.2025.04.24.19.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 19:28:48 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Fri, 25 Apr 2025 10:28:13 +0800
Subject: [PATCH v6 2/3] spi: dt-bindings: snps,dw-apb-ssi: Add compatible
 for SOPHGO SG2042 SoC
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-sfg-spi-v6-2-2dbe7bb46013@gmail.com>
References: <20250425-sfg-spi-v6-0-2dbe7bb46013@gmail.com>
In-Reply-To: <20250425-sfg-spi-v6-0-2dbe7bb46013@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745548101; l=1082;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=ZmdPpnOZ86WV8AspiWmmzZXwyUoSGbTCqeZlZB1Dz/w=;
 b=gxD0ZGLEmhTB+UWLpRrBTOWrtsQ4OIQo4V7QCfO3+5juR/uiw842tItKKNNYO/cvyov+2Qhfd
 MmIQ/Uc6t0qDmYKN7Rmv47ERGvbISoFG18X+1DmWMDmxE6RYENOJLWT
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
index a43d2fb9942d85b1482a52782c0a97cd5c6edd99..53d00ca643b318a8e75b9b79dbc6bf63962fc3be 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -66,6 +66,7 @@ properties:
               - mscc,ocelot-spi
               - mscc,jaguar2-spi
               - renesas,rzn1-spi
+              - sophgo,sg2042-spi
               - thead,th1520-spi
           - const: snps,dw-apb-ssi
       - description: Intel Keem Bay SPI Controller

-- 
2.49.0

