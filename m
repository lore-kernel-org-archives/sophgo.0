Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A188267B04
	for <sophgo@lists.linux.dev>; Thu, 13 Mar 2025 13:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741871526; cv=none; b=CNEgPyAwRUsnARxP+c1SKLk+FNwkhxoeq5W9LrUsYESW4Ips2UOu6ubjV9E8ExtxyKwputm1XoXuQK97fN11qYI1zUO1NwSlgBj2cY/7l9puIPbcPP/iqCPXLLMqDJsZnIILjL3D0ZitLJQBW9xVXVIkbiwHy2CsdfdXhIdn9OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741871526; c=relaxed/simple;
	bh=losN7+Xc5utDKmJ4z+1lgugBumic+UE1GU4OYTnTOco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V4tALBiLDVjY4nFI0COYP0RPY9XWYGJGTQpbl0FRQUFc7om1MuOm1/MtMjtfQCxA5O8+bKvoHDB8rBO1A+ZrF1PNsH5/trijxdyA4kGpvy7vutA39KpG5GoipUlSdPiUh1SIk4ylB3Uzz3DvsLahCer/hV5qm9Fa9y8G7P0l6Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/0iOb/l; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/0iOb/l"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-225b5448519so15988935ad.0
        for <sophgo@lists.linux.dev>; Thu, 13 Mar 2025 06:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741871524; x=1742476324; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ioHnF4CSbRYwCOFInozClNxdEAsDMbHLiEMPDV5mWJ8=;
        b=T/0iOb/lL2OoCh4OaSZIYv8TC5CkHuAFWZT/avSHyxOhLdTbcO1gZ8q5JIdDBSpAwG
         Zh5tpxhkzpmRtXOgV1ZVT5iUw7d8JWKXkiLzU6GQuBjoFYqg2KAkytTkvWSBZxtEoPft
         wjjyNl/ESJxfN+tulOXsFesknt7AYFMSQ85MNneTqV0MX6UprvFF8jNq8PUcTuxB7Yk9
         ewuj2ymKc1Tbl/RKQxelwCCYdh2A+O8QYYmsTZ1ckk+hVBHNF5Qc0/iCs4h3PPAuNpcm
         opiG5sDA0O3y6yYbi1oFaj2Ijfodknyx/PpWVbqe8/aPTFsjdNKfX/rKnlMiZr4WYXnB
         yqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741871524; x=1742476324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ioHnF4CSbRYwCOFInozClNxdEAsDMbHLiEMPDV5mWJ8=;
        b=Ecrgtho3OHGUjHtzZ5IFNusFKQKRDs7355DIfEL6gQRuL6obHfFwd0EryXMbYwfZwA
         qIeBilhsA22toxBz4994HX9Oa+FYAhStTkRXnKI05ivA/2jUktnqJ0ddCqueT30D73PM
         c2+whvg5MIOE32budcZJyoX0PCaYQCzTxjOKhK+zQQrLn4QHaE09hnpkM4YwwjMVVhxk
         Ciqvnkqn6UOoxfoPCY7rUPMr7zt6+1bclkxtZEgz/560QE2Vr+X5kcyv0WYHzV9yH8kU
         2Uj+35gvs48oDOJmUDrnlOpvGkmrV0O2ZGL2NtGuvvNLI//OUs2aG0X1oS9bQEyEd1+z
         qFUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZC5FZhBsYX0a07hWiwLywxOfYWb3MB1uw061OFUzd5OxbUr6K1wi6jWUYHUOxm1/fOSNzDkc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjrgiB20TKFqBp/tgQvnwJFy7eBp1yoKaBq+2Uai77B+HY7J5N
	hY8cUTBjz+4AAyVNHQZG/3cMC6lsqLnR9NLKEIDTrjsgZk/e27m5
X-Gm-Gg: ASbGnct1XO4eyr+krwYoA6rHGfWAYgR6d3Ou/WwNGnFiI/biTqvba6h6c8sX9E7BBJb
	EdVKt03udoZmTkjUfIOk47gWQTv3x5TOdteVhq9SvmGtDhsxSTHAbxc69nLm05YIgRPRWUVaAMw
	asdW1Na4li/7j2g4QLQzcrSmYx8H5Pe7TgzYxmaLptK3bMl/y9ezw/HVquICQRUjFcPY9P7uQ9M
	piuDz+M+tvU3cm5tPfHjLKPk0PCdd7nlcRngRLJzUA3QgGk7YjHUx15nF4AqhKxHzrknjRBhqin
	RWvlNJUcQmQ4hTNVzHkbNZf+4i2RE9p/Nz4=
X-Google-Smtp-Source: AGHT+IH2Tw+QYfXY3WazHSYYhYEHi4iFK5Rz3wHX0nrqtQpHEZJOcKdnWkhmCHmNlfUvzg4HFsOddg==
X-Received: by 2002:a17:902:e80a:b0:224:6ee:ad with SMTP id d9443c01a7336-22428c01371mr410617775ad.44.1741871524191;
        Thu, 13 Mar 2025 06:12:04 -0700 (PDT)
Received: from [198.18.0.9] ([2a0f:7803:fac5:a7b6::1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6d52sm12539615ad.116.2025.03.13.06.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 06:12:03 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Thu, 13 Mar 2025 21:11:49 +0800
Subject: [PATCH v3 1/2] spi: dt-bindings: snps,dw-apb-ssi: Add compatible
 for SOPHGO SG2042 SoC
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250313-sfg-spi-v3-1-e686427314b2@gmail.com>
References: <20250313-sfg-spi-v3-0-e686427314b2@gmail.com>
In-Reply-To: <20250313-sfg-spi-v3-0-e686427314b2@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, chao.wei@sophgo.com, 
 xiaoguang.xing@sophgo.com, dlan@gentoo.org, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741871512; l=949;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=losN7+Xc5utDKmJ4z+1lgugBumic+UE1GU4OYTnTOco=;
 b=ndAuJNM+9Z0GCvopXpM8mOuezwgblTRngkyxWcXuEIrGOBWqA386LTSVTso8ktm5ASWERKBR2
 QOnejMyOqQdCTA3gURZiiSj9KkfobekfTyP2sNO3oT/NcCArQUd2yVc
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=

add compatible property to include "sophgo,sg2042-spi" for
the SOPHGO SG2042 SoC SPI Controller.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
index bccd00a1ddd0ad92b437eed5b525a6ea1963db57..33fb21267df2594e68419cfb980a40909868e337 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -92,6 +92,10 @@ properties:
         items:
           - const: thead,th1520-spi
           - const: snps,dw-apb-ssi
+      - description: SOPHGO SG2042 SoC SPI Controller
+        items:
+          - const: sophgo,sg2042-spi
+          - const: snps,dw-apb-ssi
 
   reg:
     minItems: 1

-- 
2.48.1

