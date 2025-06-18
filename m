Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64351A5BAF
	for <sophgo@lists.linux.dev>; Wed, 18 Jun 2025 03:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750216376; cv=none; b=lY9SRkJ0mfE/DfNv+fTwkcz4LjxNuKJ7Id5BeVdyWjWyMfT20c6CxZOXpg084shHfY4cO3Ccz58/QaGRgAYAgIEDlMNJL/zAAe8gcwLVmRDAKYop53d7PkysVXusNByEU9/hQlGXnQ4imPRepENIyV+7pO4z/0YKWqXM7EBtj34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750216376; c=relaxed/simple;
	bh=ktV8hgQhTmZKELriqt5A7lzUoAJwbdgckiDQ88mnWDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dWh19i0rK2JqHB2Cc2juFNlEJwuSsxkiieLcfQ+ptU6BogNdh/F5QSadaPIgoocSIkpTnoaSGw2VEWoZ6AJKqN3/loAwnutWCbi2sggBfKU6yvCdi+ufyiXv3hI6j9LntW8E848p22Cogmn6wqz+meDMe2BsVBy+2wQeYdNhZSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ntnca9hP; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ntnca9hP"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso7092122a91.3
        for <sophgo@lists.linux.dev>; Tue, 17 Jun 2025 20:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750216374; x=1750821174; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxtR8f3zNuWY8ESAfyPo4qfcZH0MTD+lNydzwpGAHoc=;
        b=ntnca9hP6SJbBMLD6hgrtdPID/OQt+HVfZLXjnz5wtKJxDCkTjD5PhrvD8b+n7d7RV
         +gbLZKRNgDx2VWpl/QBRBfthSZ934yyxfyMHLy3+CCckG46S2Vdx19+6aGlm6fV3DZ9R
         r3C8kOrqw679WBZ4A++2I6qQwe8/H3uI9CtRjoiuav6N/vmogUfrv6t65SekeFctmSsz
         lyWGI3U/9ttoB8b0RN0BoOUkaCNwH857GNPi9wG2op51GUaw6bZStBYXbTOB+sz6QqQX
         AwReBXqsHVunkUQ3MekYfvubBgZILcry9hFZLxwPzn8JdjFoRiy2KJTqW5Tr3eBWEQ9c
         wO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750216374; x=1750821174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxtR8f3zNuWY8ESAfyPo4qfcZH0MTD+lNydzwpGAHoc=;
        b=Q6o15WEftls75FLKirJbY/2qIntLw0l9bIAGwnX9lcQmyllIqzGz7kOXsa4g5IsfME
         S55OM1TApUMGRNA3PhVYlk+O497s4q/KFMS/Sn1A985+MImKzJ854jKKftuAXVQ+Lf9g
         5LIpt9C3bR3EPDHQ68TDOth2IrOUMQYSGlYNaSrNV2c1ztY3vUvNiawdC+h7RQ+8qGv7
         x+fbWP/MDboQCmrpahdBgDHvtiESwL/vFlgSITvOAu3EOPH852HjUuDx3dpI832Ppld7
         5v97/nKMXtLYsvhWfAxYa8wiZSvo/CGlzLf0HW8NyOs9x2S+DCislFsAVp1+epu7aiu9
         mhKw==
X-Forwarded-Encrypted: i=1; AJvYcCX0DDxPRRo8yMk4mD72xEQ6KsdBvcYx2fmP+6lVO0BQV4apAzptfS5CiRBBBIjd5MRHAXTNB78=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6IGtLody3xPhLRELTnUvZgRP1NW6vcLBZRSg89EdO8oNVONwM
	lrrUPsnP7u9XzoAEhZFQfJxw1A+gBj6un2wZTY//fKyxqB7NfkJUPkgfHYxCJoWN3Z8=
X-Gm-Gg: ASbGncsR5+BHoJvidiSVJm9R8hBP6Ra/W5nweeaPna65WQDzpXeK98JcVivcbH8hFNY
	uggRQrVamdsYAcprwnSYvIHIaHL3+fJCvT4DacuHv2MrcJ0ZpBwyhDsZGgdGisKdFvjDe/uL9O8
	YQi2sNBLuC5MfkW1+JuRIj6rroigmaSxNZa8U4MjkFXx1s5Ihg5QkNKNuF5Z6AVgbH80TQLiFZC
	wUcD7CB87MHbWsz2Lbi7r+FRNV6E5lrkzvc3STV/1yIUnku+dhDLtpSed3LkbDoddHAwFJdL8Fl
	htiNHdOdc4YMXhnEU/q+g4TUrMTxAtoBrjWdpOZJWVxKT/q+HNuZbGHglQKEuQ==
X-Google-Smtp-Source: AGHT+IHRI7h23bZzE8G1/NzKXA2jFwp08Y53wfU3eAL9uKH1xrpt17pvruqfqTfEBZAik8++WIVP2A==
X-Received: by 2002:a17:90b:3a05:b0:313:62ee:45a with SMTP id 98e67ed59e1d1-313f1cd69femr22420814a91.13.1750216374059;
        Tue, 17 Jun 2025 20:12:54 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365d88bf54sm89057425ad.46.2025.06.17.20.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 20:12:53 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/2] dt-bindings: usb: dwc2: rename sophgo usb compatible string
Date: Wed, 18 Jun 2025 11:11:29 +0800
Message-ID: <20250618031132.373216-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618031132.373216-1-inochiama@gmail.com>
References: <20250618031132.373216-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The support for Sophgo CV1800 series SoC introduces a wildcard compatible
string "sophgo,cv1800-usb", rename it to sophgo,cv1800b-usb to match a
real world SoC. As the compatible string is not used in any board dts.
It is safe to rename it.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index e83d30a91b88..6c3a10991b8b 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -59,7 +59,7 @@ properties:
       - const: amcc,dwc-otg
       - const: apm,apm82181-dwc-otg
       - const: snps,dwc2
-      - const: sophgo,cv1800-usb
+      - const: sophgo,cv1800b-usb
       - const: st,stm32f4x9-fsotg
       - const: st,stm32f4x9-hsotg
       - const: st,stm32f7-hsotg
-- 
2.49.0

