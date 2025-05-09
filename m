Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85F82609EB
	for <sophgo@lists.linux.dev>; Fri,  9 May 2025 22:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746830250; cv=none; b=jjS6qzpaxYNmUlVsSoYEn9KdS0z86s4wPUHNL5KtTR1m28vtyvDcpQg1ZVKenMNPtUUrQyVxclV7amutxZj6nUnuHFjX9KOvFoYYz/DJsoCGwoD8JN0mkbtJbJMTmp42rEl0DMR/b6YWAvNoZNDVX8oyVkj5Ei1cWyXPO4TErTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746830250; c=relaxed/simple;
	bh=A3w4RuWEmr5Bdnc77LbTtq0I+pATPQNYK9q8S93+9hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ouiTyXZlKzO0SFh29YuNkRBjh2AnFX2I92jRL2CrLQ3n8EeZ+aI/Lras1He8pvgWFnQos4yOSEkvAt5UNghE/XrrtprjJMAxW8XYi6WzJ8U9OX5w1ARTk8b9jUaBsVVbFfnpKP7XT4/tSbm0zl6tNum5JHw8j1LdO0h9MIvK4QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bFlfYhzM; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bFlfYhzM"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6f53c42cea6so24030806d6.0
        for <sophgo@lists.linux.dev>; Fri, 09 May 2025 15:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746830248; x=1747435048; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wls++UmOuF/4mPyEoE5Qu8r2syygUVJY2hk7mKDxU0s=;
        b=bFlfYhzMVn0/z3wEVFMw2gxfvqKnbgLI0Z4cf3Gxy2icPr7hOLLL9anm6N0HgplLOk
         vrx5HYXgZAFLyM6xvwyFHO7M+EuM8HK85ZjzMSP+2NaYvJlb7qgiggzLCWD+y7+arKsJ
         2NX0COdXdQHH3i1BYai9RGCtNqDoOGlrEH+lI8VElOv6FGecY0StLlmtfSycAMbvJGSF
         sCW4E+XqXJdkdb6n7IalN1W/Za8CUDPlRRXWPlGyOvRSK0wJEEOTNSGLSqzsSx9gDeCr
         vUZha8UTUPELDgVBvH7L5HpPmSNF5hXu29SWusoRoECA9pyzzA9piY738GtpuH5y1eTk
         /CAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746830248; x=1747435048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wls++UmOuF/4mPyEoE5Qu8r2syygUVJY2hk7mKDxU0s=;
        b=nuzzGpMQw+u/fI1tO6xIcPievnF3NdlAn+9fmjlgENdFPjSfnR4V6ZUuLsXf0DfDc7
         V4gO/rboC7C3bxLf2xKbfVXt9O1SHwaiKsVG/w2rDTSF7gRzYQquZEgwHGf5/WY5tCaE
         emHzkDl2QgBvYky13l7jE1rMuxchRRkQi6iR8yucwoMOWDxDi+ppBSpL9efC4JsN4MTO
         Vopxukls3i07+PpBbYatBV5QhzsEDtqrWAmjGgBnttBdsGTjeaSp+JPQShXYv9zRke9S
         w4/hZuqzYaO8NN7zIt9DahvJEhsPutiWfkDAohIbcnAkTZtuqAe3VQkVw5BnKKNtVPnz
         U04w==
X-Forwarded-Encrypted: i=1; AJvYcCWlQ+jDew8QsrvKBI36C/eDK/LOouJM627NNAlVOYE5Nv9ZgAVG1aO5NnnDxjd5x6deou+yNy0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXknsBudBFQWH/pqhQguASOPdOPSs0SLSwYHlwMkZmm7cp+nhg
	U9OZLm09LahaBQ+J7i/UdTfnujiacEk/MZaZ81lhnzENYqIPealO
X-Gm-Gg: ASbGncvIEcrFo+3eVDeGKWGKjoqIeqhUCD61vsx3qN9S43qD1rX3l1l7h8R48DhltZo
	tFztIAAMAJJKq8aTVEWJqUgGv3o6dsR62e+FNFZyDFP10rV0sJoOPJmyemOjJrdGC2IcPZKSs79
	8dIDUVBGqp3AnAA4ZP8J10XdNQ7MdyFfTxVlHa3Cjp1X+XiAmAowL50EyY2NwdbEz1+TyNxZbNY
	JZOBc3GUWFXDgoAaDhx+uKEU1VfNltZ5f7W8mMxXeiW3GCUTRlc2p5s1l3gscFct3k8PBiPbtWq
	E3uqeug84pJ5OE/RCdAREKJPSXA=
X-Google-Smtp-Source: AGHT+IGT4gynGMwVrr5xrHK5k1kPhXxajuXtDsQp/TWj+voeyjLTQ+BuPWtRD2a2o0XUy3TbdPOunQ==
X-Received: by 2002:a05:6214:528f:b0:6f4:f458:7ef2 with SMTP id 6a1803df08f44-6f6e480f83amr63955966d6.43.1746830247675;
        Fri, 09 May 2025 15:37:27 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f6e39e0685sm19440936d6.13.2025.05.09.15.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 15:37:27 -0700 (PDT)
Date: Sat, 10 May 2025 06:37:00 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: riscv: add Sophgo x4 EVB bindings
Message-ID: <5hn5ywklwlc2cfjeesarg7hcf2knsujloxijzp46o26ox33yzo@6kuf3bkqqigf>
References: <cover.1746811744.git.rabenda.cn@gmail.com>
 <4a9236b67a368423c1bb1a86720dfcd7593f0d1b.1746811744.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a9236b67a368423c1bb1a86720dfcd7593f0d1b.1746811744.git.rabenda.cn@gmail.com>

On Sat, May 10, 2025 at 02:13:29AM +0800, Han Gao wrote:
> Add DT binding documentation for the Sophgo x4 EVB board [1].
> 
> Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB [1]
> 
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> ---
>  Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> index ee244c9f75cc..0f93f4cbfc6c 100644
> --- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
> @@ -35,6 +35,7 @@ properties:
>            - enum:
>                - milkv,pioneer
>                - sophgo,sg2042-x8evb
> +              - sophgo,sg2042-x4evb
>            - const: sophgo,sg2042
>  
>  additionalProperties: true
> -- 
> 2.47.2
> 

Please keep alphabetical order.

Regards,
Inochi
