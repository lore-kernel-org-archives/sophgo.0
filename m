Received: from freeshell.de (freeshell.de [116.202.128.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26772820DA
	for <sophgo@lists.linux.dev>; Sun, 28 Sep 2025 04:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.128.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759033071; cv=none; b=Ks6WW4e4Ljbcy7xzrFaynYDYnwOMXB4U6nMdWZd3X6DiluEFs98OQrJNZWjjnLdoKu95D94piH3q3iJAUwXAUqWj8I6wOyuRJLPMtY83exyF2AoV+6+D5MMGjl1Wt0EjPllpaJiULXPiPGmsEEsf+6xUf5JT1+A0L83XBSX9/x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759033071; c=relaxed/simple;
	bh=XkAhhlm3Vm6N9Azx6Hp6HbxTOcaJYnTV2itoBAeTI9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EW4UU4ya/0Y0WeWNBA9BDah0Vx+AUTyohxnsCMcnYOp7Pc04qEPTVoXJVcixHfxCd2iu81IV5uZdSjqr/LYcOHIgwVHePcU7o+tMYoSsfMUxR99L8iXy3s+OeDWi+IOKnmmlGZ/2/V+04JQWHWYy+FyrSVjHiGhbpTFCOSf24Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de; spf=pass smtp.mailfrom=freeshell.de; arc=none smtp.client-ip=116.202.128.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=freeshell.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freeshell.de
Received: from [192.168.2.54] (unknown [98.97.27.29])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id C16D3B220293;
	Sun, 28 Sep 2025 06:09:06 +0200 (CEST)
Message-ID: <79444de4-e9bf-457c-a9b0-0a017a1f2555@freeshell.de>
Date: Sat, 27 Sep 2025 21:09:04 -0700
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: soc: sophgo: add Milk-V Duo S board
 compatibles
To: Joshua Milas <josh.milas@gmail.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, unicorn_wang@outlook.com, inochiama@gmail.com,
 alexander.sverdlin@gmail.com, rabenda.cn@gmail.com,
 thomas.bonnefille@bootlin.com, chao.wei@sophgo.com
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev
References: <20250927173619.89768-1-josh.milas@gmail.com>
 <20250927173619.89768-2-josh.milas@gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20250927173619.89768-2-josh.milas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Joshua,

On 9/27/25 10:36, Joshua Milas wrote:
> Document the compatible strings for the Milk-V Duo S board[1]
> which uses the SOPHGO SG2000 SoC[2]
> 
> Link: https://milkv.io/duo-s [1]
> Link: https://en.sophgo.com/sophon-u/product/introduce/sg200x.html [2]
> 
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---
>  Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
> index 1c502618de51..2fcc63b1a036 100644
> --- a/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
> +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo.yaml
> @@ -28,6 +28,7 @@ properties:
>            - const: sophgo,cv1812h
>        - items:

>            - enum:
> +              - milkv,duo-s
>                - milkv,duo-module-01-evb

Sort enums.

>            - const: milkv,duo-module-01
>            - const: sophgo,sg2000

Best regards,

-E Shattow
