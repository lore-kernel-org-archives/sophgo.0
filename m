Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A5B53A7
	for <sophgo@lists.linux.dev>; Sat, 11 Oct 2025 01:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760147497; cv=none; b=L34W03MkSdIx84oIsDN03ygOjU8AV823r/VOjSubkHhZQSTfAQyzkcsxN92TpZoHSMLZX7tCVMOGN+aITnh+ndTBqgQDe9HonFWGBZFLw4MgmcUR0BUYJCczBho7yFzzbb3jIYXXKAX+VdJ4c1OINyhv1zcDZR6QbnnCn7X1ibs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760147497; c=relaxed/simple;
	bh=pU/iDesyCnVT5h+Bir1cF5MtBRvEVNTZLxYcIueRX4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkC2WYro93+/dH7392fqcv1bnAzldh8O933rBYhoslepM9L5IU+bC5pNvbkuvhv5VpHWVhe7MAwUDuARSQqk+K8tRE+1I48+WycHCpFdhlekeH9Lb1TOAaJnfKbZktn6CMxcLmRdkNw0s1Yxuknr+TwkpVOdsanC7FKsM4If6K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTdJvwRm; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTdJvwRm"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b63148d25c3so1883276a12.1
        for <sophgo@lists.linux.dev>; Fri, 10 Oct 2025 18:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760147495; x=1760752295; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=teUHmj8fooMBhuzCTm7slxnW8DwXWVkNHJT/VXMMwXk=;
        b=MTdJvwRmaovWeTP81Yh/y4qTeCVuv30RKZ6MjHZ5sjcq1lMUmvUSyr1r4OB/IwK5YK
         5C5/kH0gLi23AJHk/COjEpDqUEDMnxCTyBefZGOi3mJQuFdcOHWFKtsP4HU+WWSMgIE1
         Z4sxl1vZ/1oT0PXexFS7KPas1iL2PDP4kZB3V+6Bnlq2Gw1slZYz+tNKfNrrjn+g8+Zz
         PNUBH1qSBpDVpSGJQ14LHrOLHeWwXsJFizqGhx+jDK8i+26sCqlKwh91p4iF1i0AjccM
         2NBCi3B54nMzF7Yu8EJRkUhZymqjj3s5smQ85nRz0cvdATZZZBgc8g1tGm256g0WsLzr
         soNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760147495; x=1760752295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=teUHmj8fooMBhuzCTm7slxnW8DwXWVkNHJT/VXMMwXk=;
        b=GdVkcRGGm5U3oI5JR/tcT9RXRWqsSX8kiloXFovA+4BVDVvpjL1dLjMXNu8+vPw4W8
         rNpS14E7CjN922UPJaLc67zIfRUYVPvfgVUGPWUc6R6m5rL5p5clRRFp2/NwHT3c9LC1
         72FUsxokMd3EH7xf43W0yh9u19u/dsuM2p9/IQp2esDRHYDkXwoxs2rie1SYai2/HZ7H
         La2wO1WqfhEjiBqcAqD1jPxUdCDQejnclW9/FhoLVqFP20BmeiChODDykjE2iLk7WYwu
         7iPZs9C7gE30w1pOQ24gFdzfonqZ4oPusowUONSmfW8ieCro1RHV4t5N08R7I4zOhuGm
         dNRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyM58uriq1iULkh9X0/Nacya77Z384w8k/e3U8c6S3vU9prCKh6yxVZ0MKIebxlxRohFIi9cY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNGDDfq2bAxFEAXIiRg1BBVhI/HsX8YKFvttTXWeia+9WiF491
	iOjVlnU0Y2gnuDXyisy/hrVDY5JzpBbrl3b8Ev+Cv3xuS9Lt8ePXgAgT
X-Gm-Gg: ASbGncubVVWJDNk+Y47Es6dis3WEeCvqJ0Pc40iVOVUi8lRNbJpmqb1t/un2IwGc0u3
	VEOJCihP9Y4kM9Qs/FBip4YdYDssK3YNl/S4/5cRRk7v9yiPn8KKDo+obmTeobxkC/6/U4p9Tys
	/nhkQd2t/MEeRon3vjGo4mlaA5E8gQ7ol6vz4zDSPErc98ZuYSGKn/O0m9PAczElisEtba2iwf8
	UfJezchi+10QJ7uk8lv1zdu8CFPHIEKZn5Ewc8P7SIcKFBiTSSjw5uHJ3D/dVHWc1mjpQWXE08M
	HBqGxzs7zAk/gSmRGrvJKrPtTbxDDSW49AxlsEgiT5W1zEzEte9SfN59ojrs7KrU4Zy+5jjBdXF
	pnFWjrCD9xTb+YRAYD7fb60XSYDQdY4wncdRkq4JK
X-Google-Smtp-Source: AGHT+IE3K6gFip9wxGITzlqymiDh7UAUD0eWbAaJZOHiLQbKOsh6fbE3Epzbc5CedugnlKFm2bUpCg==
X-Received: by 2002:a17:903:2f4b:b0:271:bd13:7e73 with SMTP id d9443c01a7336-28ec9c97605mr196969385ad.19.1760147495504;
        Fri, 10 Oct 2025 18:51:35 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-29034f362efsm69922305ad.89.2025.10.10.18.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 18:51:35 -0700 (PDT)
Date: Sat, 11 Oct 2025 09:50:53 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Joshua Milas <josh.milas@gmail.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, unicorn_wang@outlook.com, 
	inochiama@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, alexander.sverdlin@gmail.com, 
	rabenda.cn@gmail.com, thomas.bonnefille@bootlin.com, chao.wei@sophgo.com, 
	liujingqi@lanxincomputing.com
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: sophgo: add Milk-V Duo S board
 compatibles
Message-ID: <fdysolp3ogf4ra2kpr565xtkwspk3yqj6ydbkxl67wi7fviabp@x4owynopb6s4>
References: <20251011014811.28521-1-josh.milas@gmail.com>
 <20251011014811.28521-2-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011014811.28521-2-josh.milas@gmail.com>

On Fri, Oct 10, 2025 at 09:48:09PM -0400, Joshua Milas wrote:
> Document the compatible strings for the Milk-V Duo S board [1]
> which uses the SOPHGO SG2000 SoC [2] on the ARM64 side. The RISCV
> side uses the SOPHGO CV1812h [3].
> 
> Link: https://milkv.io/duo-s [1]
> Link: https://en.sophgo.com/sophon-u/product/introduce/sg200x.html [2]
> Link: https://www.sophgo.com/sophon-u/product/introduce/cv181xh.html [3]
> 
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---
>  Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
> index 1c502618de51..63773811b80f 100644
> --- a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
> +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
> @@ -25,12 +25,17 @@ properties:
>        - items:
>            - enum:
>                - sophgo,huashan-pi
> +              - milkv,duo-s

Why? I know no duo S board use cv1812h.

>            - const: sophgo,cv1812h
>        - items:
>            - enum:
>                - milkv,duo-module-01-evb
>            - const: milkv,duo-module-01
>            - const: sophgo,sg2000
> +      - items:
> +          - enum:
> +              - milkv,duo-s
> +          - const: sophgo,sg2000
>        - items:
>            - enum:
>                - sipeed,licheerv-nano-b
> -- 
> 2.51.0
> 
