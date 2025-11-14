Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFDF221F29
	for <sophgo@lists.linux.dev>; Fri, 14 Nov 2025 00:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763081086; cv=none; b=fPQzhKc7rmm2j9je797TgMvctJHvaI8gZM12FNxrXKdhI2F2LRNVjppoFTpGo9/Pa8YFPT7JRlDYm1A6NSVF2WIzGCnHSens1TViGIHn1dQySvDcCkuxTWDH2w1X3x/OwTmcGHeknRu8uNS7LzgcQ+rpcjRVKxCWStECH9A2ZBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763081086; c=relaxed/simple;
	bh=LwIRwAFzw0dXy5ckYyTbkNonSYIHgG2ZAUuHV9IY4Po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rx4fBl39/K2gYhRQu9sCLr5sOyWsF7b+/A56KtAWIuM2ieETBUSPpN3tmxaau3JQ0bgtpjj01RTwr8h5UT0PVNn5ZkwGnRODvRH+Kq3ejqjIsRnKWp53jISXqier+thv0Xl6dnSA4lK031ylwzOybxfCYTJ2JbXbvrXN0I+CftQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzBn+0UG; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzBn+0UG"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso1024561a12.3
        for <sophgo@lists.linux.dev>; Thu, 13 Nov 2025 16:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763081083; x=1763685883; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5LXJv7wRXF9U/cick5b/LfhiRGQebQw7e2o2OTwwBSk=;
        b=XzBn+0UGMMRwwrdY3gYPK0xbfa6N8lLgygMwuFjhjrLgti4APO9MxatOLsDxRYVrme
         YCwmxtjDNotw79/nbLAxmXKNiz5D0PcXiS7BmJOP+XBP5hs9NcctLw5L0Ok5fjeHkLZ/
         P1xgguqJUPSjsUbCQXXvFMZxhAYLWq/8KHiLW6R82bbLrLgl8Wk9Eg/en3b3W70PMVsc
         WGwR3KDHrntMfhuWsDIiy0+G9Q0vWxS6SnDhb24UE2SNlvbQHRN7kpsZEVUsJZevpG70
         cyHI/9+Alp2OFv6uIja/K4bKIeacBvvlySY598NyIPmerzHj8QllxQOYCrMZVxF2vIYe
         ESdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763081083; x=1763685883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LXJv7wRXF9U/cick5b/LfhiRGQebQw7e2o2OTwwBSk=;
        b=BOKufHVkt6+t3yeUJ/zUK5bvSsWmPZ7HjL+4kGGc8E90zyLs3tgYbTtxlgdtPzR6tH
         J6pWrEBUFTlm7bhilYm/qXjiZrOIuyICC9ouvoo6rmu/xY5/54m4jpAko0xgL/JQxFC9
         mIyqHWJfxXAlnDGyuINhRaz0OpVbBRTvc4VXUIXUgizU2rNYaatO35DcV8GWQnK94r0Q
         pdVanB98YcG4ObURbM69KTR2OJto+pKJetNX7TADSSbEmMHTiuLLTmi5h+Byw+pE1+b5
         1r/YqTzHxCsIHqDfU7nPv/iXBW+7cbEtipubiT0ki+NgU7gudak1h2ptQGxZ3dMkEslG
         VcRw==
X-Forwarded-Encrypted: i=1; AJvYcCVQskjv+hSDGn4Xl8qx0dgVJZP0vOnMygGwJU9YhogAySfSedehmOHtag6zLKFKkvyNIBxJ434=@lists.linux.dev
X-Gm-Message-State: AOJu0YzG6xeZVNjKwSpVcHcUAMCSaF/ErgNLo9C0yFIvwe1RnjZwkw24
	xzwTbQ7qbwy26tMIQD5cTIHaKF57hZ0tfF9lrIVj7JNh6znCqcUwyZrn
X-Gm-Gg: ASbGncuT7JwVJ8/rfjWtB/P+v2ThhXhJhjaMGspKbFqfK2NgXLk85cbsGDxFpYvTM9O
	D1/mWMX24rKIfSGmPZT0Y3Qg54PObkSjPT9Afvi9Tdp/9wknoXw1GdInxG7qHQ09X1L8euYt7DT
	RwBJemco4YeRz+2eV1ofFRHwKRfDK9vt04aAQIWWD7yH8lq8j7mfJyK2NxifTo0XALp60GDhU2P
	FZmKz3pJjeSiSwH1FGxcIVGzKqugXQ/QNediIGhUo7mrJZiFfOgSo3DHnDTQ97b6xtXHGjRNwQW
	Y1l8c5HzDV/tXBvWSRH76K/M4psNtuYgyn8ORwhJ01OYDukTwDMBMBy1pKf50ErgwH4VG6KsY3b
	qlEB0phyCER2S08+OEIg+Nj7EAb2AUJwl+TxTEKlUtIPRayuUp79zBUO027PIxFBPPb/czuavTY
	w=
X-Google-Smtp-Source: AGHT+IEIKjjPhOVUqGPDpl5dOo+GAofGTEs4SPWCZYKYPUBqhOjG64m/9E3v+5NweXcdOCz4DDVv4g==
X-Received: by 2002:a05:701a:ca8c:b0:119:e569:f62b with SMTP id a92af1059eb24-11b41707c45mr465043c88.36.1763081082981;
        Thu, 13 Nov 2025 16:44:42 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885e3sm3672341c88.0.2025.11.13.16.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 16:44:42 -0800 (PST)
Date: Fri, 14 Nov 2025 08:44:15 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy
 mode restriction
Message-ID: <yjl3gnf2gwh327wbbwcbkxwnqy5tyhwutffovlxhcm7b4vr2xu@he4tg6bcrduu>
References: <20251114003805.494387-1-inochiama@gmail.com>
 <20251114003805.494387-2-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114003805.494387-2-inochiama@gmail.com>

On Fri, Nov 14, 2025 at 08:38:03AM +0800, Inochi Amaoto wrote:
> As the ethernet controller of SG2044 and SG2042 only supports
> RGMII phy. Add phy-mode property to restrict the value.
> 
> Also, since SG2042 has internal rx delay in its mac, make
> only "rgmii-txid" and "rgmii-id" valid for phy-mode.
> 
> Fixes: e281c48a7336 ("dt-bindings: net: sophgo,sg2044-dwmac: Add support for Sophgo SG2042 dwmac")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> index ce21979a2d9a..e8d3814db0e9 100644
> --- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> @@ -70,6 +70,25 @@ required:
>  
>  allOf:
>    - $ref: snps,dwmac.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: sophgo,sg2042-dwmac
> +    then:
> +      properties:
> +        phy-mode:
> +          enum:

> +            - rgmii-rxid
> +            - rgmii-id

Hi, Conor,

I have restricted the phy-mode with wrong mode here, it should be
rgmii-rxid instead of rgmii-txid as the SG2042 always add rx delay
in their mac. As this is more like a mistake for me when writing
the binding, I keep you tag with the fix. If you need something
further, please let me know.

Regards,
Inochi

> +    else:
> +      properties:
> +        phy-mode:
> +          enum:
> +            - rgmii
> +            - rgmii-rxid
> +            - rgmii-txid
> +            - rgmii-id
>  
>  unevaluatedProperties: false
>  
> -- 
> 2.51.2
> 
