Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F8923F41A
	for <sophgo@lists.linux.dev>; Fri,  9 May 2025 18:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746814454; cv=none; b=Eian8bv/9dblW9/IEq0QuJcURQ9DyPImbdlz6iut0IiBYe1ssSZpTEpvS+J2596FUM0rSRKOwBh/QSc+jYlpvtcqD0mBI7EA7YqLgINZFIxoEU50WdjBzFd4dhcXTbyFFs2GN1yg5KeUlNv2cYUwVc394Q8IedNFF5WnNjQXvQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746814454; c=relaxed/simple;
	bh=PIM3vKbypW+AeUpWeN+6R2pr/Ih8OShFct+42urf9eI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NGgGWwKCT3WsJBZUPUgIgLVIahUQy9HMv6r0meC++OPbk1AHWpjdOxZmTYDsgAbm/9eM3bkTX2oCK2SoFXVDkkD9UttwUfpyS1tp6fRwZ8bN8cGhctvIVmifIP+UGIkvNFovLShAuz0OLpfywXyjc3ijO+AQJ3Zay2hcC2Do9hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2NISuZQ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2NISuZQ"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-30a89c31ae7so3219500a91.2
        for <sophgo@lists.linux.dev>; Fri, 09 May 2025 11:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746814452; x=1747419252; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzqFJPNWlFb5Vyjzb2p+dns6qiD8V6vJLvgrZd1P9GU=;
        b=b2NISuZQPRfKGwnrlBTxEAbcV6R8BPzTsXajdLE5wsfrfGIdZO1g1PEH2JaG8GXRto
         gllBh5vVmd6+P0Top3IgB9MIP4C7j/5TomAcvT4mwc5wRznk01BA+fLpHAjvMGV2RdcV
         CDXtI9Ny7WEp2f7hktm5yRDRROyDf5jIHTLCphgnnmFJVbIjkQtOMQfrakLtLj8QP6Zw
         miD7KRMJSAWP7YARULO1xKa/PmdPhZ+stXYAb4439FnPU0VX0EYevjDuVfEF6BRGDi6Z
         qyHvYGKJ/Eqzqt0iaJWAooOXNQ4I1YolmJlKPuxxLboyM7P2ZoFM8p0QLUw5yK1adT+d
         74pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746814452; x=1747419252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uzqFJPNWlFb5Vyjzb2p+dns6qiD8V6vJLvgrZd1P9GU=;
        b=lFklI90xgrZ7wvyDDGy1qJDycQBVFFyK/eTwV3QJtdg2XI/6yUibHLgg9Iy4v0LoEf
         +9ntfQUe9fuUHrVx/rm5L2KGXitZJRxXVAvbCD5xF9TNaP/Dl8Dz9XNI6s0VYmMg4Ou+
         SNnyjUDQiwgqm7pUSS8xD7I7NTr7YzC0s6902bqtI/R+FyBgvaJf/3fAb687JykZshGO
         0tB8ipBmgvgLOXcOV29uo4BbE+YddOXXFydT3gWicfXai1lda3vv/pWz7RQHFg5luyN8
         F08ERRG4cLhyZUzNqBrvJq8wX8yaVq9HIX9INDV6b7ZLS8oQTMeMf1EXo9WAFezIaqI1
         OL+w==
X-Forwarded-Encrypted: i=1; AJvYcCUrGIZ+O9CZ75bNpQdXQJCU0iFeJiPROMv9gC0zwmAdoGow0dK01BCaIhHtKedCEQSMLFGtFMI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbpnP4VcRBhUWPUCJl8v87YcpRs0a6BlbMKnD4FJxQuZow2SlF
	LiujbLeEjpx1NKHglbrUeE6/lakstnD2ty0xZK/tR9/k9KKNamCy
X-Gm-Gg: ASbGncsVJU9J5EGyAcGVRDIgTwRXarn8O2JTIniywB8EhlYcTht19rtIU+oojRf2ERZ
	rCdqJVrF0MljFniBrWz606HGcyVtRJgvhSRIO7DZHjAInkta4tUUTIbO4RLCBMSl6cgL/ugurZ+
	UQwwMtmY+gs8M3nWIzM0LM/jToZ6fmlJQqA1JoOSwf+hqyv9jPMeKKQs5jZwYMJOwZTHVss49dE
	VQ2iiXZtMlTcCX3wLjXPuVtR6DiQdT2f1wjfrtqzVOeEpKmT86KaJTzyvHeC80WHOFv2prbIFzb
	9dD996CATU/y9JpHWmTRqQgERF38/8lhDv89TaHfqDTGaigmRoo=
X-Google-Smtp-Source: AGHT+IHa2KjYQjIdgaOluaX4vIX9MeA+TzhVP7ZXcPWMW4rnYDKm6roeCXeZYEdWNrVM1+kd8Ns2Hg==
X-Received: by 2002:a17:90a:d2c5:b0:30c:523e:89e7 with SMTP id 98e67ed59e1d1-30c523e8d29mr2996226a91.16.1746814451476;
        Fri, 09 May 2025 11:14:11 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e61083sm2127309a91.30.2025.05.09.11.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:14:11 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: riscv: add Sophgo x4 EVB bindings
Date: Sat, 10 May 2025 02:13:29 +0800
Message-ID: <4a9236b67a368423c1bb1a86720dfcd7593f0d1b.1746811744.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1746811744.git.rabenda.cn@gmail.com>
References: <cover.1746811744.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT binding documentation for the Sophgo x4 EVB board [1].

Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index ee244c9f75cc..0f93f4cbfc6c 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -35,6 +35,7 @@ properties:
           - enum:
               - milkv,pioneer
               - sophgo,sg2042-x8evb
+              - sophgo,sg2042-x4evb
           - const: sophgo,sg2042
 
 additionalProperties: true
-- 
2.47.2

